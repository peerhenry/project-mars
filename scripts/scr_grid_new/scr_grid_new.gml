/// @param grid_type
scr_trace("scr_grid_new");
var arg_grid_type = argument0;

var new_grid = instance_create_layer(0, 0, macro_grid_layer, obj_grid);
with(new_grid)
{
	grid_type = arg_grid_type;
}

return new_grid;