# 1. Read the polygon with the study area from the `exdata/harz_borders.gpkg` file using the `read_sf()` function from the **sf** package.
# 2. Read the raster data with the land cover for Europe from the `exdata/lc_europe.tif` file using the `rast()` function from the **terra** package.
# Visualize both datasets.
# 3. Crop and mask the raster to the borders of the polygon.
# Visualize the results.
# 4. Calculate a spatial signature for the study area. 
# Can you understand its meaning?
# 5. Find which areas from the Europe raster are the most similar to the study area (it make take a minute or so).
# Try a few different window sizes (e.g., 200 or 500).
