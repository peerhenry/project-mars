function test_create_pump() {
	test_init(test_create_pump);

	// arrange
	var pump = instance_create_depth(0,0,0,obj_pump);

	// act
	with(pump){	event_user(macro_event_finalize); }
	var grid = scr_get_grid_prop(pump, macro_grid_water, macro_grid_prop_grid);
	scr_grid_update(grid);

	// assert
	assert_equal(0, grid.total_production, "water grid total production");
	assert_equal(0, grid.total_demand, "water grid total demand");
	assert_equal(0, grid.net_output, "water grid net output");
	assert_false(scr_get_grid_prop(pump, macro_grid_water, macro_grid_prop_can_perform_role), "can perform role");

	// cleanup
	instance_destroy(pump);

	test_result();


}
