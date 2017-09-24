var cell_size = 32;
var half_cell_size = cell_size/2;
global.horizontal_cells = floor(room_width/cell_size)-1;
global.vertical_cells = floor(room_height/cell_size)-1;
global.nav_grid = mp_grid_create(
	half_cell_size, // left
	half_cell_size, // top
	global.horizontal_cells,	// horizontal cells
	global.vertical_cells, // vertical cells
	cell_size, // cell width
	cell_size);// cell height

test_suite_step();
test_suite_navigation();
test_suite_actions();
test_suite_combat();