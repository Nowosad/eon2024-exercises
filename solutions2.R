# 1. The marginal entropy and relative mutual information can be calculated using the **landscapemetrics** package's functions: `lsm_l_ent()` and `lsm_l_relmutinf()`.
# Calculate both of these metrics for the `exdata/lc_small.tif` raster.
# 2. Read the `exdata/lc_europe.tif` raster using `rast()` from the **terra** package and the `exdata/polygons.gpkg` vector data using the `read_sf()` function from the **sf** package.
# Calculate the marginal entropy and relative mutual information for each polygon using the `sample_lsm()` function.
# 3. Join the calculated values with the polygons (see <https://r-spatialecology.github.io/landscapemetrics/articles/irregular_areas.html> for more details).
# 4. Calculate SHDI and AI for the polygons.
# Compare the values of SHDI and AI with the marginal entropy and relative mutual information (e.g., using a scatterplot or by calculating the correlation coefficient).
# Are the results similar?
# 5. (Extra) Create your own polygonal grid using `st_make_grid()` function from the **sf** package for the area from the `exdata/polygons.gpkg` file.
# Calculate the marginal entropy and relative mutual information for each square using the `sample_lsm()` function.
# Visualize the results.
library(terra)
library(landscapemetrics)
library(tidyr)
library(dplyr)
lc_small = rast("exdata/lc_small.tif")
# 1
lsm_l_ent(lc_small)
lsm_l_relmutinf(lc_small)
# 2
lc_europe = rast("exdata/lc_europe.tif")
my_polygons = read_sf("exdata/polygons.gpkg")
it_metrics = sample_lsm(lc_europe, my_polygons, what = c("lsm_l_ent", "lsm_l_relmutinf"))
it_metrics
# 3
it_metrics_wide = pivot_wider(it_metrics, names_from = metric, values_from = value)
my_polygons = left_join(my_polygons, it_metrics_wide, by = c("pid" = "plot_id"))
# 4
lc_metrics = sample_lsm(lc_europe, my_polygons, what = c("lsm_l_shdi", "lsm_l_ai"))
lc_metrics
lc_metrics_wide = pivot_wider(lc_metrics, names_from = metric, values_from = value)
my_polygons = left_join(my_polygons, lc_metrics_wide, by = c("pid" = "plot_id"))
my_polygons_df = st_drop_geometry(my_polygons)
my_polygons_df = select(my_polygons_df, ent, relmutinf, ai, shdi)
cor(my_polygons_df)
plot(my_polygons_df)
# 5
my_grid = st_sf(geom = st_make_grid(my_polygons, n = 10))
plot(lc_europe)
plot(my_grid, add = TRUE)
my_grid_metrics = sample_lsm(lc_europe, my_grid, what = c("lsm_l_ent", "lsm_l_relmutinf"))
my_grid_metrics
my_grid_metrics_wide = pivot_wider(my_grid_metrics, 
                                   names_from = metric, values_from = value)
my_grid = cbind(my_grid, my_grid_metrics_wide)
plot(my_grid["ent"])
plot(my_grid["relmutinf"])