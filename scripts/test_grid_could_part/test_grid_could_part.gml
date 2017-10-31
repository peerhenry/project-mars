test_init(test_grid_could_part);

// arrange
var cable1 = instance_create_depth(64,32,0,obj_cable);
var cable2 = instance_create_depth(64,64,0,obj_cable);
var cable3 = instance_create_depth(64,96,0,obj_cable);
var cable4 = instance_create_depth(64,128,0,obj_cable);
var cable5 = instance_create_depth(32,96,0,obj_cable);
with(obj_cable)
{
	under_construction = false;
}
// assert setup
var surrounding = scr_get_surrounding_grid_components(cable2, macro_grid_electric);
assert_equal(noone, surrounding[0], "surrounding[0]"); // E
assert_equal(noone, surrounding[1], "surrounding[1]"); // NE
assert_equal(cable1, surrounding[2], "surrounding[2]"); // N
assert_equal(noone, surrounding[3], "surrounding[3]");
assert_equal(noone, surrounding[4], "surrounding[4]");
assert_equal(cable5, surrounding[5], "surrounding[5]");
assert_equal(cable3, surrounding[6], "surrounding[6]"); // S
assert_equal(noone, surrounding[7], "surrounding[7]"); // SE

// act
var r1 = scr_grid_could_part(cable1, macro_grid_electric);
assert_false(r1, "r1");
var r2 = scr_grid_could_part(cable2, macro_grid_electric);
assert_true(r2, "r2");
var r3 = scr_grid_could_part(cable3, macro_grid_electric);
assert_true(r3, "r3");
var r4 = scr_grid_could_part(cable4, macro_grid_electric);
assert_false(r4, "r4");
var r5 = scr_grid_could_part(cable5, macro_grid_electric);
assert_false(r5, "r5");

// cleanup
with(obj_cable)
{
	instance_destroy();
}

test_result();