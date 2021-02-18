libs <- c(
  "httr",
  "jsonlite",
  "dplyr",
  "openssl",
  "tidyverse",
  "servr",
  "rmarkdown",
  "yaml",
  "tidyverse",
  "reactable",
  "plotly",
  "ggplot2",
  "reshape2",
  "magrittr",
  "lubridate"
)

lapply(libs, function(...){
  suppressPackageStartupMessages(library(...,quiet=T, c=T))
})

options(warn=-1)
options("scipen"=100)