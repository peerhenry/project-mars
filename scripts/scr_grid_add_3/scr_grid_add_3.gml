/// @param instance
/// @param grid_1
/// @param grid_2
/// @param grid_3
function scr_grid_add_3(argument0, argument1, argument2, argument3) {
	var arg_instance = argument0;
	var arg_grid_1 = argument1;
	var arg_grid_2 = argument2;
	var arg_grid_3 = argument3;

	var equality_number = 0;
	if(arg_grid_1 == arg_grid_2) equality_number += 1;
	if(arg_grid_2 == arg_grid_3) equality_number += 2;

	switch(equality_number)
	{
		case 1:
			var joined_grid = scr_grid_join(arg_grid_1, arg_grid_3);
			scr_connect_to_grid(joined_grid, arg_instance);
			return joined_grid;
		case 2:
			var joined_grid = scr_grid_join(arg_grid_1, arg_grid_3);
			scr_connect_to_grid(joined_grid, arg_instance);
			return joined_grid;
		case 3:
			scr_connect_to_grid(arg_grid_1, arg_instance);
			return arg_grid_1;
	}

	if(arg_grid_3 == arg_grid_1)
	{
		var joined_grid = scr_grid_join(arg_grid_1, arg_grid_2);
		scr_connect_to_grid(joined_grid, arg_instance);
		return joined_grid;
	}


	var joined_grid = scr_grid_join_3(arg_grid_1, arg_grid_2, arg_grid_3);
	scr_connect_to_grid(joined_grid, arg_instance);
	return joined_grid;


}
