// arrange
var astro = test_setup_astro();
astro.auto_construct = true;
var con = test_setup_construction();
var pile = instance_create_depth(48,48,0,obj_mdu_pile);
pile.mdu_count = 8;

// act 1
scr_autotask(astro); // should get construction as assignment

// assert
assert_equal(astronaut_action.fetching_mdu, astro.current_action, "astronaut action");
assert_false(scr_inventory_has_item_type(astro.inventory, inv_space.mdu), "astro should not have mdu");

// act 2
scr_end_path_action(astro); // should get the mdu and then deliver it to construction

// assert
assert_equal(astronaut_action.delivering_mdu, astro.current_action, "astronaut action");
assert_equal(1, con[? construction_mdu_deliveries], "construction_deliveries");
assert_true(scr_inventory_has_item_type(astro.inventory, inv_space.mdu), "astro should have mdu");

// act 3
scr_end_path_action(astro); // should deliver the mdu to the construction

// assert
assert_false(scr_inventory_has_item_type(astro.inventory, inv_space.mdu), "astro should not have mdu");

// cleanup
instance_destroy(astro);
instance_destroy(pile);
test_cleanup_construction(con);