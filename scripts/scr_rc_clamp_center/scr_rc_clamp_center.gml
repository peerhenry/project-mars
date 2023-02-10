/// takes a room coordinate and returns the center of the grid cell containing that coordinate.
function scr_rc_clamp_center(argument0) {

	return (((argument0-16) div 32)+1)*32;


}
