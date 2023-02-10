function test_add_to_grid_logic_map() {
	test_init(test_add_to_grid_logic_map);

	// Arrange
	var grid = instance_create_depth(0, 0, 0, obj_grid);
	grid.grid_type = macro_grid_electric;
	var constr = scr_create_dummy_constructable();

	// Act
	scr_add_to_grid_logic_map(grid, constr);

	// Assert
	var role = scr_get_grid_prop(constr, grid.grid_type, macro_grid_prop_role);
	var list_for_role = grid.logic_map[? role];
	assert_list_contains(list_for_role, constr);

	test_message("instance_count BEFORE cleanup... " + string(instance_count));

	// Cleanup
	instance_destroy(constr);
	instance_destroy(grid);

	test_message("instance_count AFTER cleanup... " + string(instance_count));

	test_result();


}
