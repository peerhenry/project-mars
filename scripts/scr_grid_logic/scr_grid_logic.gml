/// @param instance

var arg_instance = argument0;
var arg_object_index = arg_instance.object_index;

var grid_count = ds_map_size(arg_instance.grid_props_map);
if(grid_count == 0) exit;

var location_x = arg_instance.x;
var location_y = arg_instance.y;
// scr_get_adjacent_instances(arg_instance, obj_constructable);
var comp_east = instance_position(location_x + 32, location_y, obj_constructable);
var comp_north = instance_position(location_x, location_y  - 32, obj_constructable);
var comp_west = instance_position(location_x - 32, location_y, obj_constructable);
var comp_south = instance_position(location_x, location_y + 32, obj_constructable);

// loop over grid types
for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
{
	//var grid_props = scr_get_grid_props(arg_instance, grid_type);
	if(scr_has_grid_props(arg_instance, grid_type))
	{
		var grid = scr_connect_to_grid(arg_instance, grid_type, comp_east, comp_north, comp_west, comp_south);
		if(grid == noone)
		{
			grid = scr_grid_new_with_instance(arg_instance, grid_type);
		}
		scr_grid_update(grid);
		scr_grid_notify_components(grid);
	}
}