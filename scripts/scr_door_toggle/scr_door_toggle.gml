is_open = !is_open;
// play animation;
if(is_open) mp_grid_clear_cell(global.grid_map, i,j);
else mp_grid_add_cell(global.grid_map, i,j);