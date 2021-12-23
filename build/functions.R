# ---- API ----

get_creds <- function(){
  cat(paste(sep="\n",
            "Enter your credentials.", 
            "These are never stored on disk, just in the memory of this process.\n"
  ));

  cat("Enter DNS url (Application is using Cognito API v2.2): ");
  readLines("stdin", n=1) %>% paste0("https://", ., "/api/v2.2/") %>% Sys.setenv("url"=.)

  cat("Enter Token: ");
  readLines("stdin", n=1) %>% Sys.setenv("token"=.)
}

api_call <- function(fields, object) {

# Setting arguments for get() below
if (object == "detections") {
  countQuery <- list()
  query <- list()
  countUrl <- paste0(Sys.getenv("url"), "search/")
  url <- paste0(Sys.getenv("url"), "search/")

  countUrl <- paste0(countUrl, object)
  countUrl <- paste0(countUrl, "/?page_size=1")
  url <- paste0(url, object)
  url <- paste0(url, "/?page_size=2500")
  url <- paste0(url, "&query_string=detection.notes.note:*btp* OR detection.notes.note:*mtp* OR detection.notes.note:*fp*")
  countUrl <- paste0(countUrl, "&query_string=detection.notes.note:*btp* OR detection.notes.note:*mtp* OR detection.notes.note:*fp*")
} else {
  countQuery <- list("page_size" = 1)
  query <- list("page_size" = 2500)
  countUrl <- paste0(Sys.getenv("url"), object)
  url <- paste0(Sys.getenv("url"), object)
}
  auth <- paste("Token ", Sys.getenv("token"))

  pageNo <- 1
  self_signed <- httr::config(ssl_verifypeer=FALSE, ssl_verifyhost=FALSE)

  if (fields!="everything") query[["fields"]] <- fields

#Get the object size first
# Try api call 5 times if it fails
  # GET is an overlay to curl
  for(i in 1:5) {
    output <- GET(
      url = countUrl,
      config = self_signed,
      add_headers(Authorization = auth),
      query = countQuery
    )
    if (output$status_code == 200) break
  }

  # Handle invalid api call: error message and quit
  if (output$status_code != 200) {
    cat(paste(
      "\n\nAPI Fail: Status Code", output$status_code, 
      "\nCredentials might have changed",
      "\nCheck token & dns values for typos or spaces\n\n"
    ))
    quit(save="yes")
  }

  output <- output %>% 
    content(as="text", encoding="UTF-8") %>%
    fromJSON(flatten=TRUE)

  recordCount <- output[["count"]]
  cat("\n\n", "Found", format(recordCount, big.mark = ",", scientific = FALSE), object, "| Pages expected:", ceiling(recordCount/2500),"| Collecting data...")

  cat("\n", "Getting ", object, " page ", pageNo,"...")
  # Try api call 5 times if it fails
  # GET is an overlay to curl
  for(i in 1:5) {
    output <- GET(
      url = url,
      config = self_signed,
      add_headers(Authorization = auth, "Content-Type" = "application/json", "Cache-Control" = "no-cache", "Accept" = "application/json"),
      query = query
    )
    if (output$status_code == 200) break
  }

  # Handle invalid api call: error message and quit
  if (output$status_code != 200) {
    cat(paste(
      "\n\nAPI Fail: Status Code", output$status_code, 
      "\nCredentials might have changed",
      "\nCheck token & dns values for typos or spaces\n\n"
    ))
    quit(save="yes")
  }

  # Handle good api call: turn json to df
  output <- output %>% 
    content(as="text", encoding="UTF-8") %>%
    fromJSON(flatten=TRUE)

  url <- output[["next"]]

  if (is.null(url)) {
    url <- "nullURL"
  } 

  output <- output$results

  os <- object.size(output)
  cat("\r", "Status: Got ", object, " page ", pageNo, "(temp object size: ", format(os, units = "auto", standard = "SI", digits = 1L), ")")

  while (!grepl("nullURL", url)) {
    pageNo <- pageNo + 1
    cat("\n", "Getting ", object, " page ", pageNo,"...")

    # Try api call 5 times if it fails
    # GET is an overlay to curl
    for (i in 1:5) {
      partialOutput <- GET(
        url = url,
        config = self_signed,
        add_headers(Authorization = auth, "Content-Type" = "application/json", "Cache-Control" = "no-cache", "Accept" = "application/json"),
        query = query
      )
      if (partialOutput$status_code == 200) break
    }

    # Handle invalid api call: error message and quit
    if (partialOutput$status_code != 200) {
      cat(paste("\n\nAPI Fail: Status Code", partialOutput$status_code))
      quit(save = "yes")
    }

    partialOutput <- partialOutput %>% 
      content(as="text", encoding="UTF-8") %>%
      fromJSON(flatten=TRUE)

    url <- partialOutput[["next"]]
    
    if (is.null(url)) {
      url <- "nullURL"
    } 
    partialOutput <- partialOutput$results

    output <- rbind(output, partialOutput)
    
    os <- object.size(output)
    cat("\r", "Status: Got ", object, " page ", pageNo, "(temp object size: ", format(os, units = "auto", standard = "SI", digits = 1L), ")")
  }

  message("\n", " Finished getting ", object, "!")

  output
}

# ---- Formatting ----

api_date <- function(x) {
  as.POSIXct(x, format = "%FT%T", tz="GMT")
}

api_format <- function(df, object) {

  if(object == "d"){
    df %>%
      rename(
        fired = first_timestamp,
        assigned_user = assigned_to,
        triaged = triage_rule_id,
        type = detection_category
      ) %>%
      mutate(
        fired = api_date(fired),
        assigned_date = api_date(assigned_date),
        assigned_user = as.character(assigned_user),
        note = as.character(notes),
        triaged = ifelse(!is.na(triaged), TRUE, FALSE)
      ) %>%
      arrange(fired)
    
  } else if (object=="h") {
    if ("host_session_luids" %in% colnames(df)) { 
      df <- df %>% select(-host_session_luids)
    }
    df %>%
      mutate(last_detection_timestamp = api_date(last_detection_timestamp))
    
    # hm = host metrics: severity, hosts observed, hosts w detections
  } else if (object == "hm") {
    count_severity <- function(s) nrow(filter(df, severity==s))
    tibble(
      date = Sys.Date(),
      low = count_severity("low"),
      medium = count_severity("medium"),
      high = count_severity("high"),
      critical = count_severity("critical"),
      hosts_observed = length(unique(df$id)),
      hosts_w_detections =
        filter(df, !is.na(severity)) %>% select(id) %>% unique() %>% nrow()
    )
  }
}

# ---- Logging ----

csv_format <- function(f) {
  f %>% switch(
    "../logs/notes.csv" = cols(
      note_date = col_datetime(),
      note_user = col_character(),
      note = col_character()),
    "../logs/assigned.csv" = cols(
      assigned_date = col_datetime(),
      assigned_user = col_character()),
    "../logs/hosts.csv" = cols(
      last_detection_timestamp = col_datetime()),
    "../logs/host_metrics.csv" = cols(
      date = col_datetime(),
      .default = col_integer())
  )
}


read_log <- function(file) {
  read_csv(file, col_types = csv_format(file))
}

make_log <- function(df, file, delete=FALSE) {
  if (file.exists(file)) {
    old_rows <- read_log(file)
    if (delete) {
      old_rows <- subset(old_rows, date != last(df$date))
    }
    new_rows <- anti_join(df, old_rows, by=colnames(df))
    rbind(old_rows, new_rows) %>% write_csv(file)
  } else {
    write_csv(df, file) 
  }
}

# ---- Rmd ----

### Universal
table <- function(df){
  reactable(
    df,
    pagination = FALSE,
    highlight = TRUE,
    #searchable = TRUE,
    filterable = TRUE,
    height = 350,
    #defaultColDef = colDef(format = colFormat(digits = 2))
  )
}

check_data <- function(df) {
  if (nrow(df)==0) FALSE else TRUE
}

custom_grep <- function(...) {
  grepl(..., ignore.case = TRUE)
}

percentify <- function(num, n) {
  ((num/n)*100) %>% round(2) %>% paste0("%")
}

### Visbility Workload Reduction

list_vis_stats <- function(sub_h, sub_a, sub_hm, sub_n){
  list(
    "ho" = length(unique(sub_h$ip)),
    "d" = length(unique(sub_a$id)),
    "d_no_t" = filter(sub_a, triaged==FALSE) %>% select(id) %>% unique() %>% nrow(),
    "d_no_info" = filter(sub_a, triaged==FALSE, !grepl("INFO",type)) %>% select(id) %>% unique() %>% nrow(),
    "closed" = filter(sub_n, custom_grep("btp|mtp|fp", note)) %>% select(id) %>% unique() %>% nrow(),
    "hwd" = filter(sub_h, !is.na(severity)) %>% select(ip) %>% unique() %>% nrow(),
	 "hwd2" = round(mean(sub_hm$critical + sub_hm$high + sub_hm$medium + sub_hm$low),1),
    "crit" = round(mean(sub_hm$critical),1),
    "high" = round(mean(sub_hm$high),1),
    "medium" = round(mean(sub_hm$medium),1),
    "low" = round(mean(sub_hm$low),1)
  )
}

vis_this_time <- function(h, a, hm, n, time){
  sub_h <- filter(h, floor_date(last_detection_timestamp, unit=time) == floor_date(today(), unit=time))
  sub_a <- filter(a, floor_date(fired, time) == floor_date(today(), unit=time))
  sub_hm <- filter(hm, floor_date(date, time) == floor_date(today(), unit=time))
  sub_n <- filter(n, floor_date(note_date, time) == floor_date(today(), unit=time))
  
  list_vis_stats(sub_h, sub_a, sub_hm, sub_n)
}

vis_last_time <- function(h, a, hm, n, time){
  if (time != "quarter") {
    previous <- floor_date(today(),time) - match.fun(paste0(time,"s"))(1)
  } else {
    previous <- floor_date(today(), "quarter") - months(3)
  }
  
  sub_h <- filter(h, floor_date(last_detection_timestamp, time)==previous)
  sub_a <- filter(a, floor_date(fired, time)==previous)
  sub_hm <- filter(hm, floor_date(date, time) == previous)
  sub_n <- filter(n, floor_date(note_date, time) == previous)
  
  list_vis_stats(sub_h, sub_a, sub_hm, sub_n)
}

### TTD & TTR Top Stats
this_time <- function(df, time) {
  filter(df, floor_date(note_date, unit=time) == floor_date(today(), unit=time))
}

last_time <- function(df, time) {
  # no quarters() function, so do -1 quarter manually if time == "quarters"
  if (time != "quarter") {
    previous <- floor_date(today(),time) - match.fun(paste0(time,"s"))(1)
  } else {
    previous <- floor_date(today(), "quarter") - months(3)
  }
  filter(df, floor_date(note_date, time) == previous)
}

top_stats<- function(df) {
  tibble(
    "b"= sum(custom_grep("^btp", df$note)),
    "m"=sum(custom_grep("^mtp", df$note)),
    "f"=sum(custom_grep("^fp", df$note)),
    "n"=sum(custom_grep("^btp|^mtp|^fp", df$note)),
    "btp"=percentify(b, n),
    "mtp"=percentify(m, n),
    "fp"=percentify(f, n)
  )
}
