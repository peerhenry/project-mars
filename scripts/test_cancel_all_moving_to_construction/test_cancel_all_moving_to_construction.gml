function test_cancel_all_moving_to_construction() {
	test_init(test_cancel_all_moving_to_construction);

	// arrange
	var astro = instance_create_depth(0,0,0,obj_astronaut);
	astro.current_action = astronaut_action.moving_to_construction;
	var constr = scr_create_dummy_construction();
	astro.construction = constr;

	// act
	scr_cancel_all(astro);

	// assert
	assert_equal(astronaut_action.idle, astro.current_action, "current_action");
	assert_equal(noone, astro.construction, "construction");
	assert_equal(noone, astro.assigned_object, "assigned_object");

	// cleanup
	scr_destroy_construction(constr);
	instance_destroy(astro);

	test_result();


}
