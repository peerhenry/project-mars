locked = !locked;

if(locked){
	mp_grid_add_cell(global.grid_map, i, j);
} else {
	mp_grid_clear_cell(global.grid_map, i, j);
}

// play lock sound