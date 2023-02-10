function test_cart_deploy_cables() {
	test_init(test_cart_deploy_cables);

	// arrange
	scr_setup_finished_constructable(20, 12, macro_cable);
	var xx = scr_gi_to_rc(20);
	var yy = scr_gi_to_rc(10);
	var cart = instance_create_depth(xx, yy, 0, obj_cart);
	var carry_pump = instance_create_depth(xx, yy - 32, 0, obj_pump);
	carry_pump.under_construction = false;
	var ghost_pump = instance_create_depth(xx, yy + 32, 0, obj_pump);

	with(cart)
	{
		is_selected = true;
		carrying_instance = carry_pump;
		deploy_ghost = ghost_pump;
		action = cart_action.deploy;
	}

	// assert setup
	assert_equal(1, scr_count_instances(obj_cable), "obj_cable count");
	with(obj_cable)
	{
		assert_equal(2, cable_adjacency, "cable_adjacency");
		assert_equal(2, image_index, "image_index");
	}

	// act
	scr_end_path_action_cart(cart); // deploy

	// assert
	with(obj_cable)
	{
		assert_equal(2, cable_adjacency, "cable_adjacency");
		assert_equal(2, image_index, "image_index");
	}

	// cleanup
	instance_destroy(cart);
	with(obj_constructable) instance_destroy();

	test_result();


}
