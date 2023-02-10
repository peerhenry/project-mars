/// @param astronaut
/// @param x
/// @param y
function scr_navigate(argument0, argument1, argument2) {
	var astronaut = argument0;
	var end_x = argument1;
	var end_y = argument2;
	var max_loop = 100;

	return scr_navigate_with_retries(astronaut, end_x, end_y, max_loop);


}
