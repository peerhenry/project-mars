test_init(test_gui_with_one_item);

// arrange
var gui = instance_create_depth(0, 0, 0, obj_gui);

// act
var item = instance_create_depth(gui, 0, 0, dto_gui_item);

// assert
assert_list_contains(gui.gui_item_list, item);
assert_equal(1, ds_list_size(gui.gui_item_list), "gui_item_list size");
assert_equal(1, scr_count_instances_strict(dto_gui_item), "count dto_gui_item");
assert_equal(0, scr_count_instances_strict(dto_gui_container), "count dto_gui_container");
assert_true(ds_exists(gui.gui_item_list, ds_type_list), "container.gui_item_list exists");

// cleanup
instance_destroy(gui);

test_result();