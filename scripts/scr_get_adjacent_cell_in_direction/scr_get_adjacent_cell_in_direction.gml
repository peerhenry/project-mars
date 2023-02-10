/// @arg i
/// @arg j
/// @arg direction
function scr_get_adjacent_cell_in_direction(argument0, argument1, argument2) {
	var arg_i = argument0;
	var arg_j = argument1;
	var arg_dir = argument2;

	switch(arg_dir){
		case macro_east:
			return scr_encode_grid_coord(arg_i + 1, arg_j);
		case macro_north_east:
			return scr_encode_grid_coord(arg_i + 1, arg_j - 1);
		case macro_north:
			return scr_encode_grid_coord(arg_i, arg_j - 1);
		case macro_north_west:
			return scr_encode_grid_coord(arg_i - 1, arg_j - 1);
		case macro_west:
			return scr_encode_grid_coord(arg_i - 1, arg_j);
		case macro_south_west:
			return scr_encode_grid_coord(arg_i - 1, arg_j + 1);
		case macro_south:
			return scr_encode_grid_coord(arg_i, arg_j + 1);
		case macro_south_east:
			return scr_encode_grid_coord(arg_i + 1, arg_j + 1);
	}


}
