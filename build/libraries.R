libs <- c(
  "httr",
  "jsonlite",
  "dplyr",
  "openssl",
  "tidyverse",
  "servr",
  "rmarkdown",
  "yaml"
)

lapply(libs, function(...){
  suppressPackageStartupMessages(library(...,quiet=T, c=T))
})

options(warn=-1)