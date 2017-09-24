test_init(test_navgrid_should_clear_after_astro_pass);

var test_i = 23;
var test_j = 23;

var result = scr_navgrid_should_clear_after_astro_pass(test_i, test_j);
assert_true(result, "cell without astronaut");

var astro = instance_create_depth(scr_gi_to_rc(test_i), scr_gi_to_rc(test_j), 0, obj_astronaut);
var result2 = scr_navgrid_should_clear_after_astro_pass(test_i, test_j);
assert_false(result2, "cell with astronaut");

//cleanup
instance_destroy(astro);

test_result();