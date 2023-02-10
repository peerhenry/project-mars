/// @arg i_start
/// @arg j_start
/// @arg i_finish
/// @arg j_finish
function scr_setup_cable(argument0, argument1, argument2, argument3) {
	var i_start = argument0;
	var j_start = argument1;
	var i_finish = argument2;
	var j_finish = argument3;

	var x_tl = scr_gi_to_rc(i_start);
	var y_tl = scr_gi_to_rc(j_start);
	var x_br = scr_gi_to_rc(i_finish);
	var y_br = scr_gi_to_rc(j_finish);

	// ds_map_replace(global.construction_ghost, macro_ghost_rotation, rot); // rotation doesn't matter
	scr_update_ghost(x_tl, y_tl, x_br, y_br, macro_cable, 0, true);
	scr_build_new();
	debug_finish_all_constructions();
	scr_ghost_reset();


}
