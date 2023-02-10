function test_destruct_safe_populated_room() {
	test_init(test_destruct_safe_populated_room);

	// arrange
	var container = global.script_container;
	global.resource_amount_metal = 100000;
	script_container_register(container, "room_logic_basetile", scr_room_logic_basetile);
	scr_update_ghost(64, 64, 96, 96, macro_basetile, 0, true);
	assert_true(global.construction_ghost[? macro_ghost_valid], "ghost is valid");
	scr_build_new();
	scr_update_ghost(96, 64, 96, 64, macro_wall, 0, false);
	scr_build_new();
	scr_update_ghost(64, 64, 64, 64, macro_battery, 0, false);
	scr_build_new();
	scr_update_ghost(64, 128, 64, 128, macro_hatch, 0, false);
	scr_build_new();
	debug_finish_all_constructions();

	// assert setup
	assert_true(scr_navgrid_cell_is_free_at_rc(64, 128), "1. navgrid is free at hatch");
	assert_object_count(4, obj_base_tile);
	assert_object_count(12, obj_wall);
	assert_object_count(1, obj_hatch);
	assert_object_count(1, obj_battery);
	assert_object_count(macro_grid_type_count, obj_grid);
	assert_object_count(1, obj_room);

	// act
	scr_update_ghost(64, 64, 96, 96, macro_destruct_safe, 0, false);
	scr_build_new();
	assert_false(scr_navgrid_cell_is_free_at_rc(64, 128), "2. navgrid is free at hatch");
	debug_finish_all_constructions();

	// assert
	assert_true(scr_navgrid_cell_is_free_at_rc(64, 128), "3. navgrid is free at hatch");
	assert_object_count(0, obj_base_tile);
	assert_object_count(0, obj_wall);
	assert_object_count(0, obj_hatch);
	assert_object_count(0, obj_battery);
	assert_object_count(0, obj_grid);
	assert_object_count(0, obj_room);

	// cleanup
	script_container_register(container, "room_logic_basetile", scr_mock);

	test_result();


}
