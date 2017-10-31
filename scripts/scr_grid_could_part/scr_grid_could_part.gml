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

var flip_count = 0;
var in_gap = surrounding_instances[0] == noone;
for(var n = 1; n<8; n++)
{
	var contains_instance = surrounding_instances[n] != noone;
	if(contains_instance)
	{
		if(in_gap)
		{
			flip_count++; 
			in_gap = false;
		}
	}
	else
	{
		if(!in_gap)
		{
			flip_count++; 
			in_gap = true;
		}
	}
}

return flip_count>2;