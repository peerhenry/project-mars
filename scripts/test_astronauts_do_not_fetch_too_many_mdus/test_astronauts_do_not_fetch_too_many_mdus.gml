test_init(test_astronauts_do_not_fetch_too_many_mdus);

// arrange
var astro1 = instance_create_depth(128, 128, 0, obj_astronaut);
var astro2 = instance_create_depth(128, 128, 0, obj_astronaut);
var construction = scr_create_dummy_mdu_construction();
scr_register_new_construction(construction);
var pile1 = instance_create_depth(0, 0, 0, obj_mdu_pile);
var pile2 = instance_create_depth(0, 0, 0, obj_mdu_pile);

// act
scr_look_for_construction(astro1);
scr_look_for_construction(astro2);

// assert
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