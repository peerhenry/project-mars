/// @param grid_type
function scr_grid_new(argument0) {
	scr_trace_script("scr_grid_new", [argument0]);
	var arg_grid_type = argument0;

	var new_grid = instance_create_depth(0, 0, 0, obj_grid);
	with(new_grid)
	{
		grid_type = arg_grid_type;
	}

	scr_trace("New grid created: " + string(new_grid));

	return new_grid;


}
