test_init(test_setup_hall_outside);

// act
scr_setup_hall(5, 3, 7, 3);

// assert
assert_equal(3, scr_count_instances(obj_base_tile), "obj_base_tile count");
assert_equal(12, scr_count_instances(obj_wall), "obj_wall count");
assert_equal(1, scr_count_instances(obj_room), "obj_room count");

// cleanup
with(obj_door) instance_destroy();
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();
with(obj_room) instance_destroy();

test_result();