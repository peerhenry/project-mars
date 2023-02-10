/// @param astronaut
/// @param x
/// @param y
function scr_navigate_once(argument0, argument1, argument2) {
	var astronaut = argument0;
	var end_x = argument1;
	var end_y = argument2;

	return scr_navigate_with_retries(astronaut, end_x, end_y, 1);


}
