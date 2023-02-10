/// @arg grid
/// @arg value
function scr_ds_grid_has(argument0, argument1) {
	var arg_grid = argument0;
	return ds_grid_value_exists(arg_grid, 0, 0, ds_grid_width(arg_grid) - 1, ds_grid_height(arg_grid) - 1, argument1);


}
