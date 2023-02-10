function test_cart_pickup_cables() {
	test_init(test_cart_pickup_cables);

	// arrange
	scr_setup_finished_constructable(11, 12, macro_cable);
	scr_setup_finished_constructable(11, 13, macro_sensor);
	var sensor = noone;
	with(obj_sensor) sensor = id;
	var cable = noone;
	with(obj_cable) cable = id;

	var xx = scr_gi_to_rc(11);
	var yy = scr_gi_to_rc(10);
	var cart = instance_create_depth(xx, yy, 0, obj_cart);

	with(cart)
	{
		deploy = false;
		action = cart_action.pickup;
		assigned_instance = sensor;
	}

	// assert setup
	assert_true(sensor != noone, "sensor != noone");
	assert_equal(1, scr_count_instances(obj_cable), "obj_grid count");
	assert_equal(1, scr_count_surrounding_instances(sensor, obj_cable), "sensor has 1 adjacent cable");
	var adjacents = scr_get_adjacent_grid_components(sensor, macro_grid_electric);
	assert_equal(adjacents[1], cable, "cable from adjacent grid components");
	assert_equal(2, sensor.cable_adjacency, "sensor cable_adjacency");
	with(obj_cable)
	{
		assert_equal(8, cable_adjacency, "cable cable_adjacency");
		assert_equal(8, image_index, "image_index");
	}

	// act
	scr_end_path_action_cart(cart); // pickup

	// assert
	assert_equal(1, scr_count_instances(obj_cable), "obj_grid count");
	with(obj_cable)
	{
		assert_equal(0, cable_adjacency, "cable_adjacency");
		assert_equal(5, image_index, "image_index");
	}

	// cleanup
	instance_destroy(cart);
	with(obj_constructable) instance_destroy();

	test_result();


}
