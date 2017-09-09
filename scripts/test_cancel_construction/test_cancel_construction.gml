test_init(test_cancel_construction);

// arrange
var constr = scr_new_construction(
	0,		// mdu count
	[],		// cell array
	noone,	// prerequisite
	0,		// bounding box
	0,
	0,
	0,
	macro_player,		// owner
	0
);
var astronaut = instance_create_depth(0,0,0,obj_astronaut);
scr_pick_up_construction(astronaut, constr, astronaut_action.constructing);
var pile_list = constr[? construction_mdu_piles];

// act
scr_cancel_construction(constr);

// assert
assert_false(ds_exists(constr, ds_type_map), "ds_exists(constr, ds_type_map)");
assert_false(ds_exists(pile_list, ds_type_list), "ds_exists(pile_list, ds_type_list)");
assert_false(ds_exists(astronaut.construction, ds_type_map), "ds_exists(astronaut.construction, ds_type_map)");

// cleanup
instance_destroy(astronaut);

test_result();