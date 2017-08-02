/// @param instance
/// @param grid_1
/// @param grid_2

var arg_instance = argument0;
var arg_grid_1 = argument1;
var arg_grid_2 = argument2;

if(arg_grid_1 != arg_grid_2)
{
	show_debug_message("Testing arg_grid_1 from scr_grid_add_2..."); // DEBUG
	scr_test_grid(arg_grid_1); // DEBUG
	
	show_debug_message("Testing arg_grid_2 from scr_grid_add_2..."); // DEBUG
	scr_test_grid(arg_grid_2); // DEBUG

	var joined_grid = scr_grid_join(arg_grid_1, arg_grid_2);
	
	show_debug_message("Testing grid from scr_grid_add_2..."); // DEBUG
	scr_test_grid(joined_grid); // DEBUG
	
	scr_grid_add(joined_grid, arg_instance);
	return joined_grid;
}
else{
	scr_grid_add(arg_grid_1, arg_instance);
	return arg_grid_1;
}