// Arrange
var grid = instance_create_depth(0, 0, 0, obj_grid);
grid.grid_type = macro_grid_electric;
var constr = scr_create_dummy_constructable();

// Act
scr_add_to_grid_logic_map(grid, constr);

// Assert
var role = scr_get_grid_prop(constr, grid.grid_type, macro_grid_prop_role);
var list_for_role = grid.logic_map[? role];
var success = assert_list_contains(list_for_role, constr);

assert_list_contains(list_for_role, constr);

// Cleanup
instance_destroy(constr);
instance_destroy(grid);

return success;