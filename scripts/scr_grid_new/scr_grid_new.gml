/// @param grid_type
scr_trace_script("scr_grid_new", [argument0]);
var arg_grid_type = argument0;

var new_grid = instance_create_depth(0, 0, 0, obj_grid);
with(new_grid)
{
	grid_type = arg_grid_type;
}

show_debug_message("NEW GRID CREATED: " + string(new_grid));

return new_grid;