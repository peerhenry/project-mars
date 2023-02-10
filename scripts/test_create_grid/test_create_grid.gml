function test_create_grid() {
	test_init(test_create_grid);
	// Act
	var grid = scr_grid_new(macro_grid_electric);
	// Assert
	var grid_is_valid = assert_grid_is_valid(grid);
	// Cleanup
	instance_destroy(grid);

	test_result();


}
