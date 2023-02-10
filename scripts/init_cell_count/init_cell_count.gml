function init_cell_count() {
	// init_cell_count
	var cell_size = 32;
	global.horizontal_cells = floor(room_width/cell_size)-1;
	global.vertical_cells = floor(room_height/cell_size)-1;


}
