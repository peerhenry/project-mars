function test_drill_should_destroy_depleted_resource() {
	test_init(test_drill_should_destroy_depleted_resource);

	// Arrange
	var xx = scr_gi_to_rc(5);
	var yy = scr_gi_to_rc(5);
	var metal = instance_create_depth(xx, yy, 0, obj_resource_metal);
	metal.amount = -1;
	var drill = instance_create_depth(xx, yy, 0, obj_drill);
	var bucket = instance_create_depth(xx, yy+32, 0, obj_bucket);
	with(drill)	event_user(macro_event_finalize);
	with(bucket) event_user(macro_event_finalize);
	var grid = scr_get_grid(drill, macro_grid_electric);
	grid.net_output = 100; // set grid to have plenty of power.

	// assert setup
	assert_equal(metal, drill.resource_instance, "drill.resource_instance");
	assert_equal(bucket, drill.active_bucket, "drill.active_bucket");
	assert_true(scr_get_grid_prop(drill, macro_grid_electric, macro_grid_prop_can_perform_role), "drill can perform");

	// Act
	with(drill){ event_perform(ev_alarm, 0); }
	var res_is_gone = !instance_exists(drill.resource_instance);

	// Cleanup
	instance_destroy(bucket);
	instance_destroy(drill);

	// Assert
	assert_false(instance_exists(metal), "instance_exists(metal)");
	assert_true(res_is_gone, "res_is_gone");

	if(instance_exists(metal))
	{
		instance_destroy(metal);
	}

	test_result();


}
