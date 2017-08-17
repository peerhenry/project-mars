mp_grid_clear_cell(global.nav_grid, occ_i, occ_j);
mp_grid_clear_cell(global.nav_grid, dest_i, dest_j);
path_delete(path);
ds_grid_destroy(inventory);