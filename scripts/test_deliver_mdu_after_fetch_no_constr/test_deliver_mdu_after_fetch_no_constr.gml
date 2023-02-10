function test_deliver_mdu_after_fetch_no_constr() {
	test_init(test_deliver_mdu_after_fetch_no_constr);

	// arrange
	var astro = instance_create_depth(16,16,16,obj_astronaut);
	var constr = scr_create_dummy_mdu_construction();
	var pile = instance_create_depth(48,48,0,obj_mdu_pile);
	var is_fetching = scr_fetch_mdu(astro, constr);
	// assert the setup went as expected
	assert_true(is_fetching, "is_fetching");
	assert_equal(1, constr[? construction_mdu_deliveries], "construction_deliveries");
	var reach = scr_get_reach_state(astro, constr);
	assert_equal(reach_state.reachable, reach, "reach_state");

	// act
	scr_destroy_construction(constr);
	scr_deliver_mdu_after_fetch(astro);

	// assert
	assert_equal(astronaut_action.idle, astro.current_action,"astronaut action");

	// cleanup
	instance_destroy(astro);
	instance_destroy(pile);

	test_result();


}
