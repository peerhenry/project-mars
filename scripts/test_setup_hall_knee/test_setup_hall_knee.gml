test_init(test_setup_hall_knee);

// arrange
scr_setup_room(2,2,2,2);
scr_setup_room(6,6,2,2);

// act
scr_setup_hall(4,2,6,5);

// assert
assert_object_count(2, obj_door);
assert_object_count(3, obj_room);

// cleanup
with(obj_door) instance_destroy();
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();
with(obj_room) instance_destroy();

test_result();