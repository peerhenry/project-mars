// Navigation grid
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



// buffer for map grid
var cell_count = global.horizontal_cells * global.vertical_cells;

global.map_buffer = buffer_create(
	cell_count*2, // *2 because two bytes per cell
	buffer_fixed,
	2);	// byte aligned is 2
	
//instance_destroy();