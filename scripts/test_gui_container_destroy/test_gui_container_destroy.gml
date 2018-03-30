test_init(test_gui_container_destroy);

// arrange
var gui = instance_create_depth(0, 0, 0, obj_gui);
var container = instance_create_depth(gui, 0, 0, dto_gui_container);
var gui_list = gui.gui_item_list;
var con_list = container.gui_item_list;
var item = instance_create_depth(container, 0, 0, dto_gui_item);

// assert setup
assert_list_contains(gui_list, container);
assert_list_contains(con_list, item);

// act
instance_destroy(container);

// assert
assert_equal(0, ds_list_size(gui.gui_item_list), "gui_item_list size");
assert_equal(0, scr_count_instances_strict(dto_gui_item), "count dto_gui_item");
assert_equal(0, scr_count_instances_strict(dto_gui_container), "count dto_gui_container");
assert_false(ds_exists(con_list, ds_type_list), "container.gui_item_list exists");

// cleanup
instance_destroy(gui);
assert_false(ds_exists(gui_list, ds_type_list), "gui.gui_item_list exists");

test_result();