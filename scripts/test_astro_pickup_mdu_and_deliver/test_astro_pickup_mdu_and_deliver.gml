function test_astro_pickup_mdu_and_deliver() {
	// arrange
	var astro = test_setup_astro();
	astro.auto_construct = true;
	var con = test_setup_construction();
	scr_register_new_construction(con);
	var pile = instance_create_depth(48,48,0,obj_mdu_pile);
	pile.mdu_count = 8;

	// act 1 - AUTOTASK
	scr_autotask(astro); // should get construction as assignment

	// assert
	assert_equal(astronaut_action.fetching_mdu, astro.current_action, "astronaut action");
	assert_false(scr_inventory_has_item_type(astro.inventory, inv_space.mdu), "astro should not have mdu");

	// act 2 - END PATH ACTION (GET MDU)
	scr_end_path_action(astro); // should get the mdu and then deliver it to construction

	// assert
	assert_equal(astronaut_action.delivering_mdu, astro.current_action, "astronaut action");
	assert_equal(1, con[? construction_mdu_deliveries], "construction_deliveries");
	assert_true(scr_inventory_has_item_type(astro.inventory, inv_space.mdu), "astro should have mdu");
	assert_equal(noone, pile.assigned_astronaut, "pile has no assigned astronaut");
	assert_false(pile.is_assigned, "pile is not assigned");

	// act 3 - DELIVER MDU
	scr_end_path_action(astro); // should deliver the mdu to the construction

	// assert
	var pile_list = con[? construction_mdu_piles];
	var pass = assert_equal(1, ds_list_size(pile_list), "mdu pile list length");
	if(pass)
	{
		var c_pile = pile_list[|0];
		assert_equal(obj_construction_mdu_pile, c_pile.object_index , "construction pile mdu count");
		assert_equal(0, c_pile.image_index , "construction pile mdu count");
	}
	assert_false(scr_inventory_has_item_type(astro.inventory, inv_space.mdu), "astro should not have mdu");

	// cleanup
	instance_destroy(astro);
	instance_destroy(pile);
	test_cleanup_construction(con);
	scr_clear_all_construction_queues();


}
