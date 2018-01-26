test_init(test_setup_door_outside);

// act
scr_setup_door(2, 2, 0);

// assert
assert_equal(0, scr_count_instances(obj_door), "obj_door count");

test_result();