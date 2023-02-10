/// @param instance
/// @param grid_1
/// @param grid_2
function scr_grid_add_2(argument0, argument1, argument2) {

	var arg_instance = argument0;
	var arg_grid_1 = argument1;
	var arg_grid_2 = argument2;

	if(arg_grid_1 != arg_grid_2)
	{
		var joined_grid = scr_grid_join(arg_grid_1, arg_grid_2);
		scr_connect_to_grid(joined_grid, arg_instance);
		return joined_grid;
	}
	else{
		scr_connect_to_grid(arg_grid_1, arg_instance);
		return arg_grid_1;
	}


}
