var navgrid = global.nav_grid;
mp_grid_clear_cell(navgrid, occ_i, occ_j);
mp_grid_clear_cell(navgrid, dest_i, dest_j);

if(path_exists(path)) path_delete(path);