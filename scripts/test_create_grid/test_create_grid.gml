scr_trace("Running test_Create_grid");

// Act
var grid = scr_grid_new(macro_grid_electric);

// Assert
var grid_is_valid = assert_grid_is_valid(grid);
// Cleanupt
instance_destroy(grid);

return test_show_result("test_suite_grid", grid_is_valid);