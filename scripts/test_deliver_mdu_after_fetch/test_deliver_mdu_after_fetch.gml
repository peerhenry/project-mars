function test_deliver_mdu_after_fetch() {
	test_init(test_deliver_mdu_after_fetch);

	// arrange
	var astro = instance_create_depth(16,16,0,obj_astronaut);
	var constr = scr_create_dummy_mdu_construction();
	var pile = instance_create_depth(48,48,0,obj_mdu_pile);
	var is_fetching = scr_fetch_mdu(astro, constr);
	assert_true(is_fetching, "is_fetching"); // assert the setup went as expected
	assert_equal(1, constr[? construction_mdu_deliveries], "construction_deliveries");

	// act
	scr_deliver_mdu_after_fetch(astro);

	// assert
	assert_equal(astronaut_action.delivering_mdu, astro.current_action, "astronaut action");
	assert_equal(1, constr[? construction_mdu_deliveries], "construction_deliveries");

	// cleanup
	instance_destroy(astro);
	instance_destroy(pile);
	scr_unregister_construction(constr);
	ds_map_destroy(constr);

	test_result();


}
