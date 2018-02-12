test_init(test_destruct_safe_removes_base_tile);

// arrange
scr_setup_room(1,1,1,3);

// act
var tx = scr_gi_to_rc(1);
var ty = scr_gi_to_rc(3);
scr_update_ghost(tx,ty,tx,ty, macro_destruct_safe, 0, false);
scr_build_new();
debug_finish_all_constructions();
scr_ghost_reset();

// assert
assert_object_count(1, obj_base_tile);
assert_object_count(1, obj_room);
with(obj_room)
{
	assert_equal(1, ds_list_size(tiles), "tiles list size");
}

// cleanup
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();

// assert cleanup
assert_object_count(0, obj_room);

test_result();