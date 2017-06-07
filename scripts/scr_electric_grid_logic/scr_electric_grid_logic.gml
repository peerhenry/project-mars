/// @param instance

var arg_instance = argument0;
var arg_object_index = arg_instance.object_index;

show_debug_message("");
show_debug_message("IMAGE INDEX CHECK");
show_debug_message("At the beginning of grid logic: " + string(arg_instance.image_index));

if( !object_is_ancestor(arg_instance.object_index, obj_electric_component) )
{
	exit; // exit this script if instance is not an electric component
}

var grid = scr_connect_to_grid(arg_instance);
show_debug_message("After scr_connect_to_grid: " + string(arg_instance.image_index));
if(grid > 0)
{
	// update power
	scr_electric_grid_update(grid);
	show_debug_message("After scr_electric_grid_update: " + string(arg_instance.image_index));
}
else	// make new grid
{
	scr_electric_grid_new(arg_instance);
	show_debug_message("After scr_electric_grid_new: " + string(arg_instance.image_index));
}