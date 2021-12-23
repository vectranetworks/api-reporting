# ---- Get data from API -----

cat("Calling API (2.5k results per page)...")

d_fields <- "id,src_ip,first_timestamp,assigned_date,assigned_to,notes,triage_rule_id,detection_category"
h_fields <- "id,name,ip,threat,certainty,severity,last_detection_timestamp"

d <- api_call(d_fields, "detections") %>% api_format("d")
h <- api_call(h_fields, "hosts") %>% api_format("h")
hm <- h %>% api_format("hm")

assigned_df <- select(d, id, src_ip, fired, assigned_date, assigned_user, triaged, type)
note_df <- select(d, id, fired, assigned_date, assigned_user, note)

# ---- Log API data into .csvs ----

cat("\n\nWriting logs...")
make_log(assigned_df, "../logs/assigned.csv")
colnames(note_df) <- c("id", "fired", "note_date", "note_user", "note")
note_df$note <- tolower(note_df$note)
make_log(note_df, "../logs/notes.csv")
make_log(h, "../logs/hosts.csv")
make_log(hm, "../logs/host_metrics.csv", delete=TRUE)

# ---- Modify notes.csv ----

tempNotes <- read.csv(file = "../logs/notes.csv", stringsAsFactors = FALSE)

for (i in seq_len(NROW(tempNotes))) {

  if (grepl("list(id", tempNotes$note[i], fixed = TRUE)) {
    tempNotes$note[i] <- gsub(",", "", tempNotes$note[i])
    note_date_created <- str_match(tempNotes$note[i], 'date_created = c\\("(.*?)"')
    note_created_by <- str_match(tempNotes$note[i], 'created_by = c\\("(.*?)"')
    note_note <- str_match(tempNotes$note[i], 'note = c(.*?)$')
    #cat("MATCHES: \n", note_date_created[1,2], " --- ", note_created_by[1,2], " --- ", note_note[1,2], " ---------------- ")
    tempNotes$note_date[i] <- note_date_created[1,2]
    tempNotes$note_user[i] <- note_created_by[1,2]
    tempNotes$note[i] <- note_note[1,2]

    tempNotes$note[i] <- gsub("\"", "", tempNotes$note[i])
    tempNotes$note[i] <- gsub("\\(", "", tempNotes$note[i])
    tempNotes$note[i] <- gsub("\\)", "", tempNotes$note[i])

    tempNotes %>%
      mutate(
        fired = api_date(fired),
        note_date = api_date(note_date),
        note_user = as.character(note_user),
        note = as.character(note),
      ) %>%
      arrange(fired)
  }

  if (grepl("list()", tempNotes$note[i], fixed = TRUE)) {
    tempNotes$note_date[i] <- NA
    tempNotes$note_user[i] <- NA
    tempNotes$note[i] <- NA
  }
}

tempNotesCSV <- select(tempNotes, id, fired, note_date, note_user, note)
write.table(tempNotesCSV, file = "../logs/notes.csv", sep = ",", row.names = FALSE, quote = FALSE)

cat("Done\n")

# ---- Render pages using .csvs ----

cat("Rendering pages...")
lapply(
  list.files(pattern = "\\.Rmd$"),
  (function(x) rmarkdown::render(input=x, output_dir = "..", quiet=TRUE))
)

# A company asked for all FPs to be killed.
# But not every company wants this. Comment out for other companies:
# system("./note_fixer.sh")
cat("Done\n")