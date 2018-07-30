// arrange
scr_setup_room(1,1,10,10);
var x_tl = scr_gi_to_rc(3);
var y_tl = x_tl;
var x_br = x_tl;
var y_br = x_tl;
scr_update_ghost(x_tl, y_tl, x_br, y_br, macro_suit_closet, 0, false);
var new_construction = scr_build_new();

// assert setup
assert_true(new_construction != noone, "new construction is not noone");

// act
debug_finish_all_constructions();
scr_ghost_reset();

// assert
assert_object_count(1, obj_suit_closet);
var free = true;
with(obj_suit_closet)
{
	free = scr_navgrid_cell_is_free(occ_i, occ_j);
}
assert_false(free, "free");

// cleanup
with(obj_suit_closet) instance_destroy();
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();
with(obj_room) instance_destroy();