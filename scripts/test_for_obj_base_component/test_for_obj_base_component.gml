function test_for_obj_base_component() {
	test_init(test_for_obj_base_component);

	// arrange
	var dummy = instance_create_layer(64, 64, "instances", obj_base_component);
	dummy.under_construction = true;
	var constr = scr_create_dummy_construction();
	dummy.construction_instance = constr;
	var cell = scr_create_construction_cell(dummy.occ_i, dummy.occ_j, 0, noone, dummy, noone);
	var cells = ds_list_create();
	ds_list_add(cells, cell);
	ds_map_replace(constr, construction_cells, cells);

	// act
	var destruction = instance_create_layer(dummy.x, dummy.y, "instances", obj_destruct);
	destruction.owner = dummy.owner;
	scr_deconstruct_post_creation(destruction);

	// assert
	assert_false(instance_exists(dummy), "instance_exists(dummy)");
	assert_false(ds_exists(constr, ds_type_map), "ds_exists(constr, ds_type_map)");
	assert_false(instance_exists(destruction), "instance_exists(destruction)");
	assert_false(ds_exists(cell, ds_type_map), "ds_exists(cell, ds_type_map)");
	assert_false(ds_exists(cells, ds_type_list), "ds_exists(cells, ds_type_list)");

	test_result();


}
