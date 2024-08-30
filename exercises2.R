1. The marginal entropy and relative mutual information can be calculated using the **landscapemetrics** package's functions: `lsm_l_ent()` and `lsm_l_relmutinf()`.
Calculate both of these metrics for the `exdata/lc_small.tif` raster.
2. Read the `exdata/lc_europe.tif` raster using `rast()` from the **terra** package and the `exdata/polygons.gpkg` vector data using the `read_sf()` function from the **sf** package.
Calculate the marginal entropy and relative mutual information for each polygon using the `sample_lsm()` function.
3. Join the calculated values with the polygons (see <https://r-spatialecology.github.io/landscapemetrics/articles/irregular_areas.html> for more details).
4. Calculate SHDI and AI for the polygons.
Compare the values of SHDI and AI with the marginal entropy and relative mutual information (e.g., using a scatterplot or by calculating the correlation coefficient).
Are the results similar?
5. (Extra) Create your own polygonal grid using `st_make_grid()` function from the **sf** package for the area from the `exdata/polygons.gpkg` file.
Calculate the marginal entropy and relative mutual information for each square using the `sample_lsm()` function.
Visualize the results.
