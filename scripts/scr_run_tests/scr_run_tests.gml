function scr_run_tests() {
	test_init_globals();
	// it's not ideal that this is needed in test initialization. Maybe can be removed by resolving issues with the script container...
	var inst_layer = layer_get_id("Instances");
	init_constructions_create_map(inst_layer, inst_layer, inst_layer);
	global.init_stage = false;
	var trace_was_enabled = global.enable_trace;
	global.enable_trace = false;
	global.tests_passed = true;

	scr_tests();
	scr_scenario_tests();

	global.enable_trace = trace_was_enabled;
	return global.tests_passed;


}
