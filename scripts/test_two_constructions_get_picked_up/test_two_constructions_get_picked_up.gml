test_init(test_two_constructions_get_picked_up);

// arrange
var astro1 = instance_create_depth(128, 128, 0, obj_astronaut_playable);
var astro2 = instance_create_depth(128, 128, 0, obj_astronaut_playable);
var constr1 = scr_create_dummy_mdu_construction();
scr_register_new_construction(constr1);
var constr2 = scr_create_dummy_mdu_construction();
ds_map_replace(constr2, construction_bb_left, 64);
ds_map_replace(constr2, construction_bb_right, 96);
ds_map_replace(constr2, construction_bb_top, 64);
ds_map_replace(constr2, construction_bb_bottom, 96);
scr_register_new_construction(constr2);
var pile1 = instance_create_depth(48, 16, 0, obj_mdu_pile);
var pile2 = instance_create_depth(16, 16, 0, obj_mdu_pile);

// act
scr_look_for_construction(astro1);
scr_look_for_construction(astro2);

// assert
assert_equal(astronaut_action.fetching_mdu, astro1.current_action, "astro1.current_action");
assert_equal(astronaut_action.fetching_mdu, astro2.current_action, "astro2.current_action");
assert_equal(1, constr1[? construction_mdu_deliveries], "construction_mdu_deliveries");
assert_equal(1, constr2[? construction_mdu_deliveries], "construction_mdu_deliveries");

// cleanup
instance_destroy(astro1);
instance_destroy(astro2);
scr_destroy_construction(constr1);
scr_destroy_construction(constr2);
instance_destroy(pile1);
instance_destroy(pile2);

test_result();