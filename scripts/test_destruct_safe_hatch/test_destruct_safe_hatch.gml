test_init(test_destruct_safe_hatch);

// arrange
var ii = 2;
var jj = 2;
scr_setup_room(ii, jj, 1, 3);
scr_setup_single_tile_construction(ii, jj+3, macro_hatch, 0);

// assert setup
assert_object_count(1, obj_hatch);
with(obj_hatch)
{
	assert_equal(x, scr_gi_to_rc(ii), "hatch x");
	assert_equal(y, scr_gi_to_rc(jj+3), "hatch y");
}

// act
var tx = scr_gi_to_rc(ii);
var ty = scr_gi_to_rc(jj+1);
scr_update_ghost(tx,ty,tx,ty, macro_destruct_safe, 0, false);
scr_build_new();
debug_finish_all_constructions();
scr_ghost_reset();

// assert
assert_object_count(0, obj_base_tile);
assert_object_count(0, obj_room);
assert_object_count(0, obj_hatch);

// cleanup
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();

// assert cleanup
assert_object_count(0, obj_room);

test_result();