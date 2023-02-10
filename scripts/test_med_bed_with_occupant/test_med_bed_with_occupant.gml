function test_med_bed_with_occupant() {
	test_init(test_med_bed_with_occupant);

	// arrange
	var med_bed = instance_create_depth(0,0,0,obj_med_bed);
	var astro = instance_create_depth(0,0,0,obj_astronaut);
	astro.entity_health = 20;
	var success = scr_assign(med_bed, astro);

	// assert setup
	assert_true(success, "could be assigned");

	// act
	scr_end_path_action(astro);
	// with(med_bed) event_user(macro_event_interact);

	// assert
	assert_true( scr_get_grid_prop(med_bed, macro_grid_electric, macro_grid_prop_can_perform_role), "can perform role" );

	// cleanup
	instance_activate_object(astro);
	instance_destroy(med_bed);
	instance_destroy(astro);

	test_result();


}
