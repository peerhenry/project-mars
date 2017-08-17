locked = !locked;

if(locked){
	mp_grid_add_cell(global.nav_grid, occ_i, occ_j);
} else {
	mp_grid_clear_cell(global.nav_grid, occ_i, occ_j);
}

// play lock sound