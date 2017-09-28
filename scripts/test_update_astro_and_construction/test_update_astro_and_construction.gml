test_init(test_update_astro_and_construction);

// arrange
var constr = scr_create_dummy_construction();
var astronaut = instance_create_depth(0,0,0,obj_astronaut);
var expect_action = astronaut_action.constructing;

// act
scr_update_astro_and_construction(astronaut, constr, expect_action);

// assert
assert_equal(constr, astronaut.construction, "construction");
assert_equal(expect_action, astronaut.current_action, "current_action");
assert_equal(construction_state.picked_up, constr[? construction_build_state], "construction state");

// cleanup
scr_destroy_construction(constr);
instance_destroy(astronaut);

// return result
test_result();