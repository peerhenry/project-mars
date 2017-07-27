/// @description Checks if there are adjacent components that are disconnected
/// @param instance
/// @param grid_type
var arg_instance = argument0;
var arg_grid_type = argument1;

// Aint no grid to part if object was inside.
with(arg_instance)
{
	if(object_index != obj_base_tile && position_meeting(x, y, obj_base_tile)) return false;
}

var surrounding_instances = scr_get_surrounding_grid_components(arg_instance, arg_grid_type);
//var should_maybe_part = scr_surrounder_array_is_disconnected(surrounding_instances);

var adjacency_number = 0;
var empty_adjacent_count = 0;
var corner_number = 0;
var empty_corner_count = 0;

for(var n = 0; n < 4; n += 2)	// E NE N NW W SW S SE
{
	var adj = surrounding_instances[2*n];
	if(adj != noone) adjacency_number += power(2, n);
	else empty_adjacent_count++;
	var corner = surrounding_instances[2*n + 1];
	if(corner != noone) corner_number += power(2, n);
	else empty_corner_count++;
}

return empty_adjacent_count < 3 && empty_corner_count > 0; // DEBUG

if(empty_adjacent_count > 2) return false;

switch(adjacency_number)
{
	case 15:
		// at least two corners must be empty
		if(empty_corner_count < 2) return false;
		break;
	case 7:	// ENW
		// NE and NW may not both be occupied
		if(corner_number & 3 == 3) return false;
		break;
	case 11: // ENS
		// NE and SE may not both be occupied
		if(corner_number & 9 == 9) return false;
		break;
	case 13: // EWS
		// SW and WE may not both be occupied
		if(corner_number & 12 == 12) return false;
		break;
	case 14: // NWS
		// NW and SW may not both be occupied
		if(corner_number & 6 == 6) return false;
		 break;
	case 5:
	case 10:
		// Ok! Only 2 adjacents which are opposing are disconnected.
		break;
	// 2 adjacents means the corner in between must be free
	case 3:	// E and N are occ
		if(corner_number & 1 == 1) return false;
		break;
	case 6:
		if(corner_number & 2 == 2) return false;
		break;
	case 9:
		if(corner_number & 8 == 8) return false;
		break;
	case 12:
		if(corner_number & 4 == 4) return false;
		break;
	default:
		return false;
}

return true;