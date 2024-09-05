# 1. Read the data from `exdata/lc_small.tif` and visualize it. 
# What is the location of the data? 
# What are the extent of the data and its spatial resolution?
# How many categories it contains?
# 2. Calculate Aggregation Index (AI) for the raster. 
# Interpret the results.
# 3. Calculate Total Edge (TE) for the raster.
# Interpret the results.
# Next, read the data from `exdata/lc_small2.tif`, calculate AI and TE for this raster, and compare the results with the previous raster.
# 4. Calculate Total Edge (TE) for the raster, but this time in a moving window of 9 by 9 cells.
# Visualize the results.
# 5. (Extra) Using the `read_sf()` function from the **sf** package read the `exdata/points.gpkg` file.
# Next, calculate SHDI and AI of an area of 3000 meters from each sampling point (see the `sample_lsm()` function).
library(terra)
library(landscapemetrics)
library(sf)
lc_small = rast("exdata/lc_small.tif")
# 1
lc_small
plot(lc_small)
# 2
lsm_l_ai(lc_small)
# 3
lsm_l_te(lc_small)
lc_small2 = rast("exdata/lc_small2.tif")
lsm_l_ai(lc_small2)
lsm_l_te(lc_small2)
# 4
mat_window = matrix(1, nrow = 9, ncol = 9)
w_result = window_lsm(lc_small, window = mat_window, what = "lsm_l_te")
plot(w_result$layer_1$lsm_l_te)
# 5
my_points = read_sf("exdata/points.gpkg")
plot(lc_small)
plot(my_points, add = TRUE)
sample_lsm(lc_small, my_points, size = 3000, what = c("lsm_l_shdi", "lsm_l_ai"))