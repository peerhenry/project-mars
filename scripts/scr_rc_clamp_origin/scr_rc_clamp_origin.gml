/// clamps room coordinate to origin (top-left) of the grid cell containing that coordinate.
function scr_rc_clamp_origin(argument0) {
	return ((argument0 - 16) div 32) * 32 + 16;


}
