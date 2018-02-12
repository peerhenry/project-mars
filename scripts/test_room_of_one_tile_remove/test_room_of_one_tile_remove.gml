test_init(test_room_of_one_tile_remove);

// arrange
scr_setup_room(1,1,1,1);

// act
var tx = scr_gi_to_rc(1);
var ty = scr_gi_to_rc(1);
var bt = instance_position(tx, ty, obj_base_tile);
instance_destroy(bt);

// assert
assert_object_count(0, obj_room);

// cleanup
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();

test_result();