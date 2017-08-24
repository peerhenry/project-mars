// Arrange
var grid = instance_create_depth(0, 0, 0, obj_grid);
grid.grid_type = macro_grid_electric;
var constr = scr_create_dummy_constructable();

// Act
scr_add_to_grid_tile_map(grid, constr);

// Assert
var ij = constr.encoded_ij;
var list_at_tile = grid.tile_map[? ij];
var is_in_map = assert_list_contains(list_at_tile, constr);
var is_in_key_list = assert_list_contains(grid.tile_key_list, ij);
var success = is_in_map && is_in_key_list;

// Cleanup
instance_destroy(constr);
instance_destroy(grid);

return success;