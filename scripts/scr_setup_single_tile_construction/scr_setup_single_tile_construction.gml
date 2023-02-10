/// @arg i_tl
/// @arg j_tl
/// @arg construction
/// @arg rot
function scr_setup_single_tile_construction(argument0, argument1, argument2, argument3) {
	var i = argument0;
	var j = argument1;
	var constr = argument2;
	var rot = argument3;

	ds_map_replace(global.construction_ghost, macro_ghost_rotation, rot);
	scr_update_ghost_single(i, j, constr, rot);
	scr_build_new();
	debug_finish_all_constructions();
	scr_ghost_reset();


}
