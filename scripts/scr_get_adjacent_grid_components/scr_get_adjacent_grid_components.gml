/// @param instance
/// @param grid_type
var arg_instance = argument0;
var arg_grid_type = argument1;

var components = scr_get_adjacent_instances(arg_instance, obj_constructable);

for(var n = 0; n < 4; n++)
{
	var next_component = components[n];
	if(next_component != noone)
	{
		var connects = scr_belongs_to_grid(next_component, arg_grid_type);
		if(!connects) components[@n] = noone;
	}
}

return components;