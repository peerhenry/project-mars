function test_cancel_construction() {
	test_init(test_cancel_construction);

	// arrange
	var constr = scr_create_dummy_construction();
	var astronaut = instance_create_depth(0,0,0,obj_astronaut);
	scr_update_astro_and_construction(astronaut, constr, astronaut_action.constructing);
	var pile_list = constr[? construction_mdu_piles];

	// act
	scr_cancel_construction(global.script_container, constr);

	// assert
	assert_false(ds_exists(constr, ds_type_map), "ds_exists(constr, ds_type_map)");
	assert_false(ds_exists(pile_list, ds_type_list), "ds_exists(pile_list, ds_type_list)");
	assert_false(ds_exists(astronaut.construction, ds_type_map), "ds_exists(astronaut.construction, ds_type_map)");

	// cleanup
	instance_destroy(astronaut);

	test_result();


}
