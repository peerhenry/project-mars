function test_cancel_construction_with_piles() {
	test_init(test_cancel_construction_with_piles);

	// arrange
	var constr = scr_create_dummy_mdu_construction();
	var exp_req_mdu = constr[?construction_required_mdu_remaining] - 1;
	scr_incr_construction_mdu(global.script_container, constr);
	// assert setup
	assert_equal(1, ds_list_size(constr[?construction_mdu_piles]), "construction mdu pile list size");
	assert_equal(exp_req_mdu, constr[?construction_required_mdu_remaining], "req mdu remaining");

	// act
	scr_cancel_construction(global.script_container, constr);

	// assert
	var count = 0;
	with(obj_mdu_pile)
	{
		count++;
		assert_false(under_construction, "under_construction");
		assert_false(is_assigned, "is_assigned");
		assert_equal(noone, assigned_astronaut, "assigned_astronaut");
		assert_equal(1, mdu_count, "mdu_count");
		assert_equal(0, image_index, "image_index");
	}

	assert_equal(1, count, "mdu pile count");

	// cleanup
	with(obj_mdu_pile)
	{
		instance_destroy();
	}

	test_result();


}
