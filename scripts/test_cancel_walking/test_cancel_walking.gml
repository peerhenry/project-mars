test_init(test_cancel_walking);

// arrange
var astro = instance_create_depth(32,32,0,obj_astronaut);
scr_navigate(astro, 96, 96);
with(astro)
{
	x = 64;
	y = 64;
	path_position = 0.5;
}

// act
scr_cancel_walking(astro);

// assert
with(astro)
{
	assert_false(is_moving, "is walking");
	assert_equal(64, x, "x");
	assert_equal(64, y, "y");
	assert_equal(0, image_speed, "image_speed");
	assert_equal(0, image_index, "image_index");
	assert_equal(1, path_position, "path_position");
	assert_equal(64, path_get_point_x(path, 1), "end path x");
	assert_equal(64, path_get_point_y(path, 1), "end path y");
}

// cleanup
instance_destroy(astro);

test_result();