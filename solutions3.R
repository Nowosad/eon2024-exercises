# 1. Read the polygon with the study area from the `exdata/harz_borders.gpkg` file using the `read_sf()` function from the **sf** package.
# 2. Read the raster data with the land cover for Europe from the `exdata/lc_europe.tif` file using the `rast()` function from the **terra** package.
# Visualize both datasets.
# 3. Crop and mask the raster to the borders of the polygon.
# Visualize the results.
# 4. Calculate a spatial signature for the study area. 
# Can you understand its meaning?
# 5. Find which areas from the Europe raster are the most similar to the study area (it make take a minute or so).
# Try a few different window sizes (e.g., 200 or 500).
library(terra)
library(motif)
library(sf)
# 1
harz_borders = read_sf("exdata/harz_borders.gpkg")
# 2
lc_europe = rast("exdata/lc_europe.tif")
plot(lc_europe)
plot(harz_borders, add = TRUE)
# 3
lc_harz = crop(lc_europe, harz_borders, mask = TRUE)
plot(lc_harz)
plot(harz_borders, add = TRUE)
# 4
lc_harz_sign = lsp_signature(lc_harz, type = "cove")
lc_harz_sign$signature
lc_harz_sign2 = lsp_signature(lc_harz, type = "coma")
lc_harz_sign2$signature
# 5
search1 = lsp_search(lc_harz, lc_europe, 
                     type = "cove", dist_fun = "jensen-shannon",
                     window = 100, output = "sf")
search2 = lsp_search(lc_harz, lc_europe, 
                     type = "cove", dist_fun = "jensen-shannon",
                     window = 500, output = "sf")
plot(search1["dist"], border = NA)
plot(search2["dist"], border = NA)