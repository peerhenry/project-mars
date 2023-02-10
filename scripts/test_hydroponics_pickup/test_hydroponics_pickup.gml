function test_hydroponics_pickup() {
	test_init(test_bed_one_free_space);

	// arrange
	scr_setup_room(1,1,1,3);
	var xx = scr_gi_to_rc(1);
	var yy = scr_gi_to_rc(1);
	var hydro = instance_create_depth(xx,yy,0,obj_hydroponics);
	var astro = instance_create_depth(xx,yy+32,0,obj_astronaut);
	hydro.food_level = 100;

	// assert setup

	// act
	scr_assign(hydro, astro);
	scr_end_path_action(astro);
	var result = scr_inventory_has_item_type(astro.inventory, item_type.food);

	// assert
	assert_true(result, "astronaut should have food after interacting with hydroponics");

	// cleanup
	instance_destroy(hydro);
	instance_destroy(astro);
	with(obj_base_tile) instance_destroy();
	with(obj_wall) instance_destroy();
	with(obj_room) instance_destroy();

	test_result();


}
