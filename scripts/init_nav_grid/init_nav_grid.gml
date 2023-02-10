function init_nav_grid() {
	var cell_size = 32;
	var half_cell_size = 16;
	global.nav_grid = mp_grid_create(
		half_cell_size, // left
		half_cell_size, // top
		global.horizontal_cells,	// horizontal cells
		global.vertical_cells, // vertical cells
		cell_size, // cell width
		cell_size);// cell height


}
