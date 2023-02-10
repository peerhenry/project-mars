function test_under_construction_destruct_safe() {
	test_init(test_under_construction_destruct_safe);

	// arrange
	var cq = scr_get_construction_queue(macro_player);
	global.resource_amount_metal = 100000;
	scr_update_ghost(64, 64, 192, 64, macro_basetile, 0, true);
	scr_build_new();
	// assert setup
	with(obj_base_tile)
	{
		assert_true(under_construction, "under_construction");
	}
	assert_object_count(5, obj_base_tile);
	assert_object_count(16, obj_wall);
	assert_equal(1, ds_list_size(cq), "construction_queue size");
	var constr = ds_list_find_value(cq, 0);

	// act
	scr_update_ghost(128, 64, 128, 64, macro_destruct_safe, 0, true);
	scr_build_new();

	// assert
	assert_object_count(2, obj_base_tile);
	assert_object_count(16, obj_wall);
	assert_object_count(0, obj_destruct_placemarker);
	assert_equal(1, ds_list_size(cq), "construction_queue size");
	with(obj_wall)
	{
		assert_equal(constr, construction_instance, "construction_instance");
	}
	with(obj_base_tile)
	{
		assert_equal(constr, construction_instance, "construction_instance");
	}

	// cleanup
	with(obj_wall) instance_destroy();
	with(obj_base_tile) instance_destroy();
	with(obj_destruct_placemarker) instance_destroy();
	ds_list_clear(cq);
	scr_ghost_reset();

	test_result();


}
