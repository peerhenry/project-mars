/// @param assignable
/// @param astronaut
function scr_get_spots_square(argument0, argument1, argument2) {
	var arg_assignable = argument0;
	var arg_astronaut = argument1;
	var arg_closest_side = argument2;

	var spots = [0,0,0,0];

	var south = scr_encode_grid_coord(arg_assignable.occ_i, arg_assignable.occ_j + 1);
	var north = scr_encode_grid_coord(arg_assignable.occ_i, arg_assignable.occ_j - 1);
	var east = scr_encode_grid_coord(arg_assignable.occ_i + 1, arg_assignable.occ_j);
	var west = scr_encode_grid_coord(arg_assignable.occ_i - 1, arg_assignable.occ_j);

	switch(arg_closest_side)
	{
		case macro_south:
			spots = [south, east, west, north];
			break;
		case macro_north:
			spots = [north, east, west, north];
			break;
		case macro_east:
			spots = [east, south, north, west];
			break;
		case macro_west:
			spots = [west, south, north, east];
			break;
	}

	return spots;


}
