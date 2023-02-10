function test_med_bed_without_occupant() {
	test_init(test_med_bed_without_occupant);

	// arrange

	// assert setup

	// act
	var med_bed = instance_create_depth(0,0,0,obj_med_bed);

	// assert
	assert_false( scr_get_grid_prop(med_bed, macro_grid_electric, macro_grid_prop_can_perform_role), "can perform role" );

	// cleanup
	instance_destroy(med_bed);

	test_result();


}
