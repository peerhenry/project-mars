test_init(test_destruct_safe_door_2);

// arrange
scr_setup_room(1, 1, 1, 5);
scr_setup_single_tile_construction(1, 3, macro_door, 0);

// assert setup
assert_object_count(1, obj_door);

// act
var tx = scr_gi_to_rc(1);
var ty = scr_gi_to_rc(4);
scr_update_ghost(tx, ty, tx, ty, macro_destruct_safe, 0, false);
scr_build_new();
debug_finish_all_constructions();
scr_ghost_reset();

// assert
assert_object_count(0, obj_door);
assert_object_count(2, obj_base_tile);
assert_object_count(1, obj_room);

// cleanup
with(obj_door) instance_destroy();
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();

// assert cleanup
assert_object_count(0, obj_room);

test_result();