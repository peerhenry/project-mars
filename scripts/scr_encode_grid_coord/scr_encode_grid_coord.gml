/// @description combines two 16-bit numbers into one 32 bit number
/// @param i
/// @param j
function scr_encode_grid_coord(argument0, argument1) {
	return (argument0 << 16) + argument1;


}
