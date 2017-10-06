var cell_count = global.horizontal_cells * global.vertical_cells;
global.map_buffer = buffer_create(
	cell_count*2, // *2 because two bytes per cell
	buffer_fixed,
	2);	// byte aligned is 2