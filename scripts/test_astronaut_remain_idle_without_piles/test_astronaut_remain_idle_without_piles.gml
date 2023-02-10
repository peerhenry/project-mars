function test_astronaut_remain_idle_without_piles() {
	test_init(test_astronaut_remain_idle_without_piles);

	// arrange
	var astro1 = instance_create_depth(0, 0, 0, obj_astronaut);
	var astro2 = instance_create_depth(0, 0, 0, obj_astronaut);
	var construction = scr_create_dummy_mdu_construction();
	scr_register_new_construction(construction);

	// act
	scr_look_for_construction(astro1);
	scr_look_for_construction(astro2);

	// assert
	assert_equal(astronaut_action.idle, astro1.current_action, "astro1.current_action");
	assert_equal(astronaut_action.idle, astro2.current_action, "astro2.current_action");
	assert_equal(0, construction[? construction_mdu_deliveries], "construction_mdu_deliveries");

	// cleanup
	instance_destroy(astro1);
	instance_destroy(astro2);
	scr_destroy_construction(construction);

	test_result();


}
