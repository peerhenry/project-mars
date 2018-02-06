/// @param assignable
/// @param astronaut
var arg_assignable = argument0;
var arg_astronaut = argument1;
var arg_closest_side = argument2;

var spots = [0, 0, 0, 0, 0, 0];
var ass_i = arg_assignable.occ_i;
var ass_j = arg_assignable.occ_j;

// rot_param
switch(arg_assignable.rot_param)
{
	case 0:
		var south = scr_encode_grid_coord(ass_i, ass_j + 1);
		var north = scr_encode_grid_coord(ass_i, ass_j - 2);
		var east = scr_encode_grid_coord(ass_i + 1, ass_j);
		var east_n = scr_encode_grid_coord(ass_i + 1, ass_j - 1);
		var west = scr_encode_grid_coord(ass_i - 1, ass_j);
		var west_n = scr_encode_grid_coord(ass_i - 1, ass_j - 1);
		switch(arg_closest_side)
		{
			case macro_south:
				spots = [south, east, west, east_n, west_n, north];
				break;
			case macro_north:
				spots = [north, east_n, west_n, east, west, south];
				break;
			case macro_east:
				spots = [east, east_n, south, north, west, west_n];
				break;
			case macro_west:
				spots = [west, west_n, south, north, east, east_n];
				break;
		}
		break;
	case 2:
		var south = scr_encode_grid_coord(ass_i, ass_j + 2);
		var north = scr_encode_grid_coord(ass_i, ass_j - 1);
		var east = scr_encode_grid_coord(ass_i + 1, ass_j + 1);
		var east_n = scr_encode_grid_coord(ass_i + 1, ass_j);
		var west = scr_encode_grid_coord(ass_i - 1, ass_j + 1);
		var west_n = scr_encode_grid_coord(ass_i - 1, ass_j);
		switch(arg_closest_side)
		{
			case macro_south:
				spots = [south, east, west, east_n, west_n, north];
				break;
			case macro_north:
				spots = [north, east_n, west_n, east, west, south];
				break;
			case macro_east:
				spots = [east, east_n, south, north, west, west_n];
				break;
			case macro_west:
				spots = [west, west_n, south, north, east, east_n];
				break;
		}
		break;
	case 1:
		var south_e = scr_encode_grid_coord(ass_i, ass_j + 1);
		var south_w = scr_encode_grid_coord(ass_i - 1, ass_j + 1);
		var north_e = scr_encode_grid_coord(ass_i, ass_j - 1);
		var north_w = scr_encode_grid_coord(ass_i - 1, ass_j - 1);
		var east = scr_encode_grid_coord(ass_i + 1, ass_j);
		var west = scr_encode_grid_coord(ass_i - 2, ass_j);
		switch(arg_closest_side)
		{
			case macro_south:
				spots = [south_e, south_w, east, west, north_e, north_w];
				break;
			case macro_north:
				spots = [north_e, north_w, east, west, south_e, south_w];
				break;
			case macro_east:
				spots = [east, north_e, south_e, north_w, south_w, west];
				break;
			case macro_west:
				spots = [west, north_w, south_w, north_e, south_e, east];
				break;
		}
		break;
	case 3:
		var south_e = scr_encode_grid_coord(ass_i + 1, ass_j + 1);
		var south_w = scr_encode_grid_coord(ass_i, ass_j + 1);
		var north_e = scr_encode_grid_coord(ass_i + 1, ass_j - 1);
		var north_w = scr_encode_grid_coord(ass_i, ass_j - 1);
		var east = scr_encode_grid_coord(ass_i + 2, ass_j);
		var west = scr_encode_grid_coord(ass_i - 1, ass_j);
		switch(arg_closest_side)
		{
			case macro_south:
				spots = [south_e, south_w, east, west, north_e, north_w];
				break;
			case macro_north:
				spots = [north_e, north_w, east, west, south_e, south_w];
				break;
			case macro_east:
				spots = [east, north_e, south_e, north_w, south_w, west];
				break;
			case macro_west:
				spots = [west, north_w, south_w, north_e, south_e, east];
				break;
		}
		break;
}

return spots;