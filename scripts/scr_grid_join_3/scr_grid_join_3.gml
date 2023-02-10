/// @param grid_1
/// @param grid_2
/// @param grid_3
function scr_grid_join_3(argument0, argument1, argument2) {

	var arg_grid_1 = argument0;
	var arg_grid_2 = argument1;
	var arg_grid_3 = argument2;

#macro m_j scr_grid_join

	var grido = m_j(arg_grid_1, arg_grid_2);
	return m_j(grido, arg_grid_3);


}
