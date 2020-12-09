Sys.sleep(1) # give time for server to start
Sys.setenv(TZ='US/Pacific') # set timezone

# Libraries
cat("Loading libraries...")
source("libraries.R")
cat("Done\n")

# Functions
cat("Loading functions...")
source("functions.R")
cat("Done\n")

# Get creds
cat("\n")
get_creds()
cat("\n")

# Build
cat("Building site\n")
source("refresh.R")
cat("\nSite is live! Served on localhost:4321\n\n")

# Start refresh cycle
repeat {
  # refresh rate can be changed while app is running
  t <- read_yaml("../config.yaml")$refresh
  cat(paste("Refreshing in", t, "minutes\n"))
  cat(paste("Next refresh:", Sys.time() + t*60))
  Sys.sleep(t*60)
  cat("\n\nRefreshing\n")
  source("refresh.R")
}