function test_find_navigation_target_to_construction() {
	test_init(test_find_navigation_target_to_construction);

	// arrange
	var constr = scr_create_dummy_construction();
	var astro = instance_create_depth(128+16, 128+16, 0, obj_astronaut);

	// act
	var result = scr_find_navigation_target_to_construction(astro, constr);

	// assert
	assert_true(is_array(result), "result is array");
	assert_true(result[0] > 0, "result[0] > 0");
	assert_true(result[1] > 0, "result[1] > 0");

	// cleanup
	scr_destroy_construction(constr);
	instance_destroy(astro);

	test_result();


}
