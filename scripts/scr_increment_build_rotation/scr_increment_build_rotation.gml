/// @param times
function scr_increment_build_rotation(argument0) {
	var rot = global.construction_ghost[? macro_ghost_rotation];
	global.construction_ghost[? macro_ghost_rotation] = (rot + argument0) % 4;


}
