/// @param instance
/// @param grid_type
var arg_instance = argument0;
var arg_grid_type = argument1;

var result;
result[3] = noone;		// south
result[2] = noone;		// west
result[1] = noone;		// north
result[0] = noone;		// east

with(obj_constructable)
{
	var di = occ_i - arg_instance.occ_i;
	var dj = occ_j - arg_instance.occ_j;
	
	if(dj == 0)
	{
		if(di == 1)	// east
		{
			if(scr_belongs_to_grid(id, arg_grid_type)) result[0] = id;
		}
		else if(di == -1)	// west
		{
			if(scr_belongs_to_grid(id, arg_grid_type)) result[2] = id;
		}
	}
	if(di == 0)
	{
		if(dj == -1) // north
		{
			if(scr_belongs_to_grid(id, arg_grid_type)) result[1] = id;
		}
		else if(dj == 1) // south
		{
			if(scr_belongs_to_grid(id, arg_grid_type)) result[3] = id;
		}
	}
}

return result;