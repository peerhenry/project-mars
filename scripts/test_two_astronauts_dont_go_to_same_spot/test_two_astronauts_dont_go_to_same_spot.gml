function test_two_astronauts_dont_go_to_same_spot() {
	test_init(test_two_astronauts_dont_go_to_same_spot);

	// arrange
	var astro1 = instance_create_depth(32,32,0,obj_astronaut);
	var astro2 = instance_create_depth(64,64,0,obj_astronaut);

	// act
	var can_navigate1 = scr_navigate_with_retries(astro1, 512, 512, 10);
	var can_navigate2 = scr_navigate_with_retries(astro2, 512, 512, 10);

	// assert
	assert_true(can_navigate1, "can_navigate");
	assert_true(can_navigate2, "can_navigate");
	var expected = scr_rc_to_gi(512);
	assert_false(astro1.dest_i == astro2.dest_i && astro1.dest_j == astro2.dest_j, "equal destination");

	// cleanup
	instance_destroy(astro1);
	instance_destroy(astro2);

	test_result();


}
