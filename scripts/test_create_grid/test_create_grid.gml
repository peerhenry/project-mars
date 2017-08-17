// Act
var grid = instance_create_depth(0, 0, 0, obj_grid);
grid.grid_type = macro_grid_electric;
// Assert
var grid_is_valid = assert_grid_is_valid(grid);
// Cleanupt
instance_destroy(grid);
return grid_is_valid;