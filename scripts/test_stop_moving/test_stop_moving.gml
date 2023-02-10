function test_stop_moving() {
	test_init(test_stop_moving);

	// arrange
	var astro = instance_create_depth(16,16,0,obj_astronaut);
	scr_navigate(astro, 80, 80);
	astro.path_position = 0.5;

	// act
	scr_stop_moving(astro);

	// assert
	with(astro)
	{
		assert_false(path_exists(path), "path_exists(path)");
		assert_equal(0, image_speed, "image_speed");
		assert_equal(0, image_index, "image_index");
		assert_equal(1, path_position, "path_position");
	}

	// cleanup
	instance_destroy(astro);

	test_result();


}
