test_init(test_astronauts_do_not_fetch_too_many_mdus);

// arrange
var astro1 = instance_create_depth(256, 256, 0, obj_astronaut);
var astro2 = instance_create_depth(256, 256, 0, obj_astronaut);
var construction = scr_create_dummy_mdu_construction();
scr_register_new_construction(construction);
var pile1 = instance_create_depth(128, 32, 0, obj_mdu_pile);
pile1.under_construction = false;
var pile2 = instance_create_depth(96, 32, 0, obj_mdu_pile);
pile2.under_construction = false;
// assert setup
assert_equal(1, construction[? construction_required_mdu_count], "construction_required_mdu_count");

// act
var astro1_found = scr_look_for_construction(astro1);
var astro2_found = scr_look_for_construction(astro2);

// assert
assert_true(astro1_found, "astro1 found construction");
assert_false(astro2_found, "astro2 found construction");
assert_equal(astronaut_action.fetching_mdu, astro1.current_action, "astro1.current_action");
assert_equal(astronaut_action.idle, astro2.current_action, "astro2.current_action");
assert_equal(1, construction[? construction_mdu_deliveries], "construction_mdu_deliveries");

// cleanup
instance_destroy(astro1);
instance_destroy(astro2);
scr_destroy_construction(construction);
instance_destroy(pile1);
instance_destroy(pile2);

test_result();