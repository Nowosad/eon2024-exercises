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
