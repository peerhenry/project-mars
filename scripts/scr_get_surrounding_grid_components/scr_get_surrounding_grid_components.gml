/// @param instance
/// @param grid_type
function scr_get_surrounding_grid_components(argument0, argument1) {
	var arg_instance = argument0;
	var arg_grid_type = argument1;

	var result;
	result[7] = noone;	// SE
	result[6] = noone;	// S
	result[5] = noone;	// SW
	result[4] = noone;	// W
	result[3] = noone;	// NW
	result[2] = noone;	// N
	result[1] = noone;	// NE
	result[0] = noone;	// E

	with(obj_constructable)
	{
		if(under_construction) continue;
		var di = occ_i - arg_instance.occ_i;
		var dj = occ_j - arg_instance.occ_j;
		var a_di = abs(di);
		var a_dj = abs(dj);
	
		// If di or dj is too far to be adjacent, or tile is same as instance, skip the instance
		if(a_di > 1 || a_dj > 1 || a_di + a_dj == 0) continue;
	
		if(scr_belongs_to_grid(id, arg_grid_type))
		{
			// An array of 8 elements means we can write all indices with 3 bits
			var index = (a_di*a_dj);			// bit 1: NW/NW/SW/SE
			if(dj*(di+dj) != 0) index += 2;		// bit 2: N/NW/S/SE
			if(dj>-1) && (dj-di>-1) index += 4;	// bit 3: W/SW/S/SE
			result[index] = id;
		}
	}

	return result;


}
