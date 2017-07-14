// UNFINISHED

/// @param instance

var arg_instance = argument0;
var arg_object_index = arg_instance.object_index;

var connects_to_a_grid = object_is_ancestor(arg_instance.object_index, obj_grid_component);
if( !connects_to_a_grid ) exit;

var location_x = arg_instance.x;
var location_y = arg_instance.y;
var comp_east = instance_position(location_x + 32, location_y, obj_grid_component);
var comp_north = instance_position(location_x, location_y  - 32, obj_grid_component);
var comp_west = instance_position(location_x - 32, location_y, obj_grid_component);
var comp_south = instance_position(location_x, location_y + 32, obj_grid_component);

// loop over grid types
for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
{
	var grid_props = scr_get_grid_props(arg_instance, grid_type);
	
	if(!is_undefined(grid_props))
	{
		var grid = scr_connect_to_grid(arg_instance, grid_type, comp_east, comp_north, comp_west, comp_south);
		if(grid == noone)
		{
			grid = scr_grid_new_with_instance(arg_instance, grid_type);
		}
		scr_grid_update(grid);
		scr_grid_update_components(grid);
	}
}