function test_pump_adjacent_to_drill() {
	test_init(test_pump_adjacent_to_drill);

	// arrange
	var xx = scr_gi_to_rc(5);
	var yy = scr_gi_to_rc(5);
	var water = instance_create_depth(xx, yy, 0, obj_resource_water);
	var drill = instance_create_depth(xx, yy, 0, obj_drill);
	with(drill){ event_user(macro_event_finalize); }
	var pump = instance_create_depth(xx - 32, yy, 0, obj_pump);

	// assert setup
	assert_equal(water, drill.resource_instance, "drill.resource_instance");

	// act
	with(pump){	event_user(macro_event_finalize); }
	var water_grid = scr_get_grid_prop(pump, macro_grid_water, macro_grid_prop_grid);
	var electric_grid = scr_get_grid_prop(pump, macro_grid_electric, macro_grid_prop_grid);
	scr_grid_update(electric_grid);
	electric_grid.total_production = 1000;		// make sure pump can draw energy
	electric_grid.net_output = 1000;			// make sure pump can draw energy
	scr_grid_notify_components(electric_grid);	// notify pump that energy is available
	scr_grid_update(water_grid);				// calculate water grid props

	// assert
	assert_equal(global.pump_water_production, water_grid.total_production, "water grid total production");
	assert_equal(0, water_grid.total_demand, "water grid total demand");
	assert_equal(global.pump_water_production, water_grid.net_output, "water grid net output");
	assert_equal(global.pump_energy_consumption + global.drill_energy_consumption, electric_grid.total_demand, "electric grid total demand");
	assert_true(scr_get_grid_prop(pump, macro_grid_water, macro_grid_prop_can_perform_role), "can perform role");

	// cleanup
	instance_destroy(pump);
	instance_destroy(drill);
	instance_destroy(water);

	test_result();


}
