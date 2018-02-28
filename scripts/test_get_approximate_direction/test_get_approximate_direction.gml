test_init(test_get_approximate_direction);

var dx = 20;
var dy = 20;

// test east
var dir = scr_get_approximate_direction(dx, 0);
assert_equal(macro_east, dir, "East direction");

// test north-east
var dir = scr_get_approximate_direction(dx, -dy);
assert_equal(macro_north_east, dir, "NE direction");

// test N
var dir = scr_get_approximate_direction(0, -dy);
assert_equal(macro_north, dir, "North direction");

// test NW
var dir = scr_get_approximate_direction(-dx, -dy);
assert_equal(macro_north_west, dir, "NW direction");

// test W
var dir = scr_get_approximate_direction(-dx, 0);
assert_equal(macro_west, dir, "West direction");

// test SW
var dir = scr_get_approximate_direction(-dx, dy);
assert_equal(macro_south_west, dir, "SW direction");

// test S
var dir = scr_get_approximate_direction(0, dy);
assert_equal(macro_south, dir, "South direction");

// test SE
var dir = scr_get_approximate_direction(dx, dy);
assert_equal(macro_south_east, dir, "SE direction");

assert_true(scr_navgrid_cell_is_free(1,1), "11 is free");
assert_true(scr_navgrid_cell_is_free(2,2), "22 is free");

test_result();