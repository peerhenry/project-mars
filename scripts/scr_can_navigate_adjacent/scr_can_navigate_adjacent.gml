/// @param astronaut
/// @param x
/// @param y
function scr_can_navigate_adjacent(argument0, argument1, argument2) {
	var arg_astronaut = argument0;
	var end_x = argument1;
	var end_y = argument2;

	return
		scr_can_navigate(arg_astronaut, end_x + 32, end_y)
		|| scr_can_navigate(arg_astronaut, end_x - 32, end_y)
		|| scr_can_navigate(arg_astronaut, end_x, end_y + 32)
		|| scr_can_navigate(arg_astronaut, end_x, end_y - 32);


}
