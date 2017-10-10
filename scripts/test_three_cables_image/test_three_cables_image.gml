// three adjacent cables, remove the center one and then create again => should not mess up image index
test_init(test_three_cables_image);

// arrange
var cable1 = instance_create_depth(48,48,0,obj_cable);
var cable2 = instance_create_depth(80,48,0,obj_cable);
var cable3 = instance_create_depth(112,48,0,obj_cable);

// act
instance_destroy(cable2);
cable2 = instance_create_depth(80,48,0,obj_cable);

// assert
assert_equal(0, cable1.image_index, "image index");
assert_equal(0, cable2.image_index, "image index");
assert_equal(0, cable3.image_index, "image index");

// cleanup
instance_destroy(cable1);
instance_destroy(cable2);
instance_destroy(cable3);

test_result();