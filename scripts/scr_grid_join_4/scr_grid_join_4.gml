/// @param grid_1
/// @param grid_2
/// @param grid_3
/// @param grid_4
function scr_grid_join_4(argument0, argument1, argument2, argument3) {

	var arg_grid_1 = argument0;
	var arg_grid_2 = argument1;
	var arg_grid_3 = argument2;
	var arg_grid_4 = argument3;

	var gridj1 = scr_grid_join(arg_grid_1, arg_grid_2);
	var gridj2 = scr_grid_join(arg_grid_3, arg_grid_4);
	return scr_grid_join(gridj1, gridj2);


}
