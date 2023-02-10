/// @arg i
/// @arg j
/// @arg construction(macro)
function scr_setup_finished_constructable(argument0, argument1, argument2) {
	var arg_i = argument0;
	var arg_j = argument1;
	var construction = argument2;

	var x_tl = scr_gi_to_rc(arg_i);
	var y_tl = scr_gi_to_rc(arg_j);

	scr_update_ghost(x_tl, y_tl, x_tl, y_tl, construction, 0, true);
	scr_build_new();
	debug_finish_all_constructions();
	scr_ghost_reset();


}
