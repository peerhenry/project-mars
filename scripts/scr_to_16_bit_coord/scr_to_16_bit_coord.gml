/// @description pass two 8bit integers
/// @param x
/// @param y
function scr_to_16_bit_coord(argument0, argument1) {
	var arg_x = argument0;
	var arg_y = argument1;
	return arg_x << 8 + arg_y;


}
