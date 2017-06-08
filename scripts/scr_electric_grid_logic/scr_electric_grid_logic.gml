/// @param instance

var arg_instance = argument0;
var arg_object_index = arg_instance.object_index;

if( !object_is_ancestor(arg_instance.object_index, obj_electric_component) )
{
	exit; // exit this script if instance is not an electric component
}

var grid = scr_connect_to_grid(arg_instance);
if(grid > 0)
{
	// update power
	scr_electric_grid_update(grid);
}
else	// make new grid
{
	scr_electric_grid_new(arg_instance);
}