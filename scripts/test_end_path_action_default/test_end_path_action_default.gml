test_init(test_end_path_action_default);

//arrange
var astro = instance_create_depth(48,48,0,obj_astronaut);

// act
scr_end_path_action(astro);

//assert
assert_equal(astronaut_action.idle, astro.current_action, "astronaut_action");

// cleanup
instance_destroy(astro);

test_result();