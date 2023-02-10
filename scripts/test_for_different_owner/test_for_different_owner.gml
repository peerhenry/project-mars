function test_for_different_owner() {
	test_init(test_for_different_owner);

	// arrange
	var container = script_container_create();
	script_container_register(container, "get_layer_for", scr_mock_get_layer_for);
	var dummy = instance_create_depth(64,64,0,obj_base_component);
	dummy.under_construction = true;
	var constr = scr_create_dummy_construction();
	dummy.construction = constr;

	// act
	var destruction = instance_create_depth(dummy.x, dummy.y, 0, obj_destruct);
	with(destruction)
	{
		owner = macro_nau;
		scr_deconstruct_post_creation(id);
	}

	// assert
	assert_true(instance_exists(dummy), "instance_exists(dummy)");
	assert_true(ds_exists(constr, ds_type_map), "ds_exists(constr, ds_type_map)");
	assert_false(instance_exists(destruction), "instance_exists(destruction)");

	// cleanup
	scr_cancel_construction(container, constr);
	instance_destroy(dummy);
	script_container_destroy(container);

	test_result();


}
