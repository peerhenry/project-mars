test_init(test_decr_deliveries_after_fetch);

// arrange
var astro = instance_create_depth(16,16,16,obj_astronaut);
var constr = scr_create_dummy_mdu_construction();
var pile = instance_create_depth(48,48,0,obj_mdu_pile);
var is_fetching = scr_fetch_mdu(astro, constr);
// occupy tiles that surround construction
scr_navgrid_occupy(0,1);
scr_navgrid_occupy(1,0);
// assert the setup went as expected
assert_true(is_fetching, "is_fetching");
assert_equal(1, constr[? construction_mdu_deliveries], "construction_deliveries");
var reach = scr_get_reach_state(astro, constr);
assert_equal(reach_state.unreachable, reach, "reach_state");

// act
scr_deliver_mdu_after_fetch(astro);

// assert
assert_equal(0, constr[? construction_mdu_deliveries], "construction_deliveries");

// cleanup
instance_destroy(astro);
instance_destroy(pile);
ds_map_destroy(constr);
scr_navgrid_clear_cell(0,1);
scr_navgrid_clear_cell(1,0);

test_result();