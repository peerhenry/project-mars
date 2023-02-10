function test_create_gui() {
	test_init(test_create_gui);

	// act
	var gui = instance_create_depth(0, 0, 0, obj_gui);
	var gui_list = gui.gui_item_list;

	// assert
	assert_equal(0, ds_list_size(gui.gui_item_list), "gui_item_list size");
	assert_equal(0, scr_count_instances(obj_gui_item), "count obj_gui_item");
	assert_equal(0, scr_count_instances(obj_gui_container), "count obj_gui_container");
	assert_true(ds_exists(gui.gui_item_list, ds_type_list), "container.gui_item_list exists");

	// cleanup
	instance_destroy(gui);
	assert_false(ds_exists(gui_list, ds_type_list), "gui.gui_item_list exists");

	test_result();


}
