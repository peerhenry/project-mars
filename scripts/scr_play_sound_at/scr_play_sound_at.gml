/// @arg sound
/// @arg x
/// @arg y
/// @arg should_loop
function scr_play_sound_at(argument0, argument1, argument2, argument3) {
	var arg_sound = argument0;
	var arg_x = argument1;
	var arg_y = argument2;
	var arg_should_loop = argument3;

	return scr_play_sound_at_ext(argument0, argument1, argument2, argument3, 300, 3000, 0.99, 0.2);


}
