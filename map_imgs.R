## This script contains the functions to create shapefiles of the image centroids and footprints.
## It is more of a paste-board of useful functions, not designed to run all at once

setwd("/WebODM/webodm_tests/")
library(droneimg)
library(rgdal)
cm2in <- function(x) return(x/2.54)

### Controlling Variables
data_dir <- "/Pix4D/Treasure_Island/Data"
file.exists(data_dir)
shp_dir <- "./shps"

idx <- 3
local_dir <- c("Flt01_1013_1019", "Flt02_1022_1024", "Flt03_1108_1112")[idx]
fn_base <- c("flt01", "flt02", "flt03")[idx]
local_dir; fn_base
#############################

### Main processing functions
img_dir <- file.path(data_dir, local_dir)
file.exists(img_dir)
imgMapsLst <- map_uav_imgs(img_dir, shp_save = TRUE, shp_name=c(paste0(fn_base, "_ctr"), paste0(fn_base, "_fp")), shp_dir=shp_dir)
nrow(imgMapsLst$pts)
plot(imgMapsLst$fp, asp=1, axes=T, border="red", col=NA, lwd=1, lty=2)
plot(imgMapsLst$pts, add=T, pch=16, col="red")
summary(cm2in(imgMapsLst$pts@data$gsd))

#save.image(file="droneimg_flt01-02-03.RData")

