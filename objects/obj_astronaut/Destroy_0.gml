mp_grid_clear_cell(global.grid_map, occ_i, occ_j);
mp_grid_clear_cell(global.grid_map, dest_i, dest_j);
path_delete(path);
ds_grid_destroy(inventory);