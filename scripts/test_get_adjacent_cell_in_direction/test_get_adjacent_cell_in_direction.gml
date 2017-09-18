test_init(test_get_adjacent_cell_in_direction);

var ij = scr_get_adjacent_cell_in_direction(2, 2, macro_east);
var expect = scr_encode_grid_coord(3, 2);
assert_equal(expect, ij, "East");

ij = scr_get_adjacent_cell_in_direction(2, 2, macro_north_east);
expect = scr_encode_grid_coord(3, 1);
assert_equal(expect, ij, "NE");

ij = scr_get_adjacent_cell_in_direction(2, 2, macro_north);
expect = scr_encode_grid_coord(2, 1);
assert_equal(expect, ij, "N");

ij = scr_get_adjacent_cell_in_direction(2, 2, macro_north_west);
expect = scr_encode_grid_coord(1, 1);
assert_equal(expect, ij, "NW");

ij = scr_get_adjacent_cell_in_direction(2, 2, macro_west);
expect = scr_encode_grid_coord(1, 2);
assert_equal(expect, ij, "W");

ij = scr_get_adjacent_cell_in_direction(2, 2, macro_south_west);
expect = scr_encode_grid_coord(1, 3);
assert_equal(expect, ij, "SW");

ij = scr_get_adjacent_cell_in_direction(2, 2, macro_south);
expect = scr_encode_grid_coord(2, 3);
assert_equal(expect, ij, "S");

ij = scr_get_adjacent_cell_in_direction(2, 2, macro_south_east);
expect = scr_encode_grid_coord(3, 3);
assert_equal(expect, ij, "SE");

test_result();