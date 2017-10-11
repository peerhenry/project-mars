test_init(test_get_reach_state);

// arrange
var constr = scr_create_dummy_construction();
var astro = instance_create_depth(128+16, 128+16, 0, obj_astronaut);

// act
var result = scr_get_reach_state(astro, constr);

// assert
assert_equal(macro_reachable, result, "reach state");

// cleanup
scr_destroy_construction(constr);
instance_destroy(astro);

test_result();