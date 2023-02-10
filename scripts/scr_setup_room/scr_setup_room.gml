/// @arg i_tl
/// @arg j_tl
/// @arg width
/// @arg height
function scr_setup_room(argument0, argument1, argument2, argument3) {
	var i_tl = argument0;
	var j_tl = argument1;
	var width = argument2;
	var height = argument3;

	var x_tl = scr_gi_to_rc(i_tl);
	var y_tl = scr_gi_to_rc(j_tl);
	var x_br = scr_gi_to_rc(i_tl + width - 1);
	var y_br = scr_gi_to_rc(j_tl + height - 1);

	// ds_map_replace(global.construction_ghost, macro_ghost_rotation, rot); // rotation doesn't matter
	scr_update_ghost(x_tl, y_tl, x_br, y_br, macro_basetile, 0, true);
	var new_construction = scr_build_new();
	debug_finish_construction(new_construction);
	scr_ghost_reset();


}
