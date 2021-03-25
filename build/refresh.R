# ---- Get data from API -----

cat("Calling API...")

d_fields <- "id,src_ip,first_timestamp,assigned_date,assigned_to,note_modified_timestamp,note_modified_by,note,triage_rule_id,detection_category"
h_fields <- "id,name,ip,threat,certainty,severity,last_detection_timestamp"

d <- api_call(d_fields, "detections") %>% api_format("d")
h <- api_call(h_fields, "hosts") %>% api_format("h")
hm <- h %>% api_format("hm")

assigned_df <- select(d, id, src_ip, fired, assigned_date, assigned_user, triaged, type)
note_df <- select(d, id, fired, note_date, note_user, note)

cat("Done\n")

# ---- Log API data into .csvs ----

cat("Writing logs...")
make_log(assigned_df, "../logs/assigned.csv")
make_log(note_df, "../logs/notes.csv")
make_log(h, "../logs/hosts.csv")
make_log(hm, "../logs/host_metrics.csv", delete=TRUE)
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