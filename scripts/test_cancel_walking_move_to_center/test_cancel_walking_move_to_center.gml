test_init(test_cancel_walking_move_to_center);

// arrange
var astro = instance_create_depth(16,16,0,obj_astronaut);
scr_navigate(astro, 96, 96);
with(astro)
{
	x = 48;
	y = 48;
	path_position = 0.25;
}

// act
scr_cancel_walking(astro);

// assert
with(astro)
{
	assert_false(is_walking, "is walking");
	assert_equal(48, x, "x");
	assert_equal(48, y, "y");
	assert_equal(0, image_speed, "image_speed");
	assert_equal(0, image_index, "image_index");
	assert_equal(0, path_position, "path_position");
	assert_equal(movement_speed, path_speed, "path_position");
	var clamper = scr_rc_clamp_center(48);
	assert_equal(clamper, path_get_x(path, 1), "path dest x");
	assert_equal(clamper, path_get_y(path, 1), "path dest y");
}

// cleanup
instance_destroy(astro);

test_result();