function test_update_astro_and_construction() {
	test_init(test_update_astro_and_construction);

	var calc_mdu = script_container_resolve(global.script_container, "calculate_required_mdu_count");
	assert_equal(scr_mock_return_0, calc_mdu, "calculate_required_mdu_count");
	var mdu_count = script_execute(calc_mdu, 0);
	assert_equal(0, mdu_count, "mdu_count from registered script");

	// arrange
	var constr = scr_create_dummy_construction();
	var astronaut = instance_create_depth(0,0,0,obj_astronaut);
	var expect_action = astronaut_action.constructing;
	// assert setup
	assert_equal(0, constr[? construction_required_mdu_count], "construction_required_mdu_count");
	assert_equal(construction_state.ready, constr[? construction_build_state], "setup construction_state");

	// act
	scr_update_astro_and_construction(astronaut, constr, expect_action);

	// assert
	assert_equal(constr, astronaut.construction, "construction");
	assert_equal(expect_action, astronaut.current_action, "current_action");
	assert_equal(construction_state.picked_up, constr[? construction_build_state], "construction state");

	// cleanup
	scr_destroy_construction(constr);
	instance_destroy(astronaut);

	// return result
	test_result();


}
