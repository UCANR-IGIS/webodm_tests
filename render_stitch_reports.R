## This script contains functions to render the 'Stitching Reports'.
## It does this by reading in values from Excel

#TO DO
#Put a MissionDescription column in Excel
#Treasure Island area 1, nadir, single grid, 80/70 overlap


##########################
library(rmarkdown)
setwd("/WebODM/webodm_tests/")

idx <- 2
stid <- c("ti_2018-02-17_flt01_stch01", "ti_2018-02-17_flt03_stch01")[idx]
rmarkdown::render(input="stitch_report_template.Rmd", output_file=paste0(stid, ".html"), params = list(StitchID = stid))
