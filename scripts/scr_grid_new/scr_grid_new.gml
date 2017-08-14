/// @param grid_type
var arg_grid_type = argument0;

var new_grid = instance_create_layer(0, 0, macro_grid_layer, obj_grid);
with(new_grid)
{
	grid_type = arg_grid_type;
}

show_debug_message("new grid created");
show_debug_message("obj_grid: " + string(obj_grid));
show_debug_message("new grid object index: " + string(new_grid.object_index));

return new_grid;