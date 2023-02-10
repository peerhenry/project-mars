function test_cart_pickup_grid() {
	test_init(test_cart_pickup_grid);

	// arrange
	scr_setup_finished_constructable(20, 12, macro_cable);
	scr_setup_finished_constructable(20, 13, macro_sensor);
	var sensor = noone;
	with(obj_sensor) sensor = id;

	var xx = scr_gi_to_rc(20);
	var yy = scr_gi_to_rc(10);
	var cart = instance_create_depth(xx, yy, 0, obj_cart);

	with(cart)
	{
		deploy = false;
		action = cart_action.pickup;
		assigned_instance = sensor;
	}

	// assert setup
	assert_equal(1, scr_count_instances(obj_grid), "obj_grid count");
	assert_true(sensor != noone, "sensor != noone");
	with(obj_grid)
	{
		assert_equal(2, ds_list_size(tile_key_list), "grid components");
	}

	// act
	scr_end_path_action_cart(cart); // pickup

	// assert
	assert_equal(1, scr_count_instances(obj_grid), "obj_grid count");
	with(obj_grid)
	{
		assert_equal(1, ds_list_size(tile_key_list), "grid components");
	}

	// cleanup
	instance_destroy(cart);
	with(obj_constructable) instance_destroy();

	test_result();


}
