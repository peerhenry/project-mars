// arrange
var x_tl = scr_gi_to_rc(3);
var y_tl = scr_gi_to_rc(3);
var x_br = scr_gi_to_rc(5);
var y_br = scr_gi_to_rc(5);
scr_update_ghost(x_tl, y_tl, x_br, y_br, macro_basetile, 0, true);
scr_build_new();

var x_hatch = scr_gi_to_rc(4);
var y_hatch = scr_gi_to_rc(6);
scr_update_ghost(x_hatch, y_hatch, x_hatch, y_hatch, macro_hatch, 0, true);
scr_build_new();

debug_finish_all_constructions();
scr_ghost_reset();

// assert
var free = false;
with(obj_hatch)
{
	free = scr_navgrid_cell_is_free(occ_i, occ_j);
}
assert_true(free, "free");

// cleanup
with(obj_hatch) instance_destroy();
with(obj_wall) instance_destroy();
with(obj_base_tile) instance_destroy();