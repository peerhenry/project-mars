test_init(test_three_v_cables_destroy_center);

// arrange
var cable1 = instance_create_depth(48,48,0,obj_cable);
var cable2 = instance_create_depth(48,80,0,obj_cable);
var cable3 = instance_create_depth(48,112,0,obj_cable);

// act
instance_destroy(cable2);

// assert
assert_equal(0, cable1.image_index, "image index");
assert_equal(0, cable3.image_index, "image index");

// cleanup
instance_destroy(cable1);
instance_destroy(cable2);
instance_destroy(cable3);

test_result();