test_init(test_stop_moving);

// arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
scr_navigate(astro, 100, 100);

// act
scr_stop_moving(astro);

// assert
with(astro)
{
	assert_false(is_walking, "is walking");
	assert_equal(0, image_speed, "image_speed");
	assert_equal(0, image_index, "image_index");
}

// cleanup
instance_destroy(astro);

test_result();