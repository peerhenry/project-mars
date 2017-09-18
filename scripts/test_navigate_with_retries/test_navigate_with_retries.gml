test_init(test_navigate_with_retries);

// arrange
var astro = instance_create_depth(32,32,0,obj_astronaut);

// act
var can_navigate = scr_navigate_with_retries(astro, 512, 512, 10);

// assert
assert_true(can_navigate, "can_navigate");
var expected = scr_rc_to_gi(512);
assert_equal(expected, astro.dest_i, "dest_i");
assert_equal(expected, astro.dest_j, "dest_j");

// cleanup
instance_destroy(astro);

test_result();