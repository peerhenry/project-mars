function test_cancel_walking() {
	test_init(test_cancel_walking);

	assert_true(scr_navgrid_cell_is_free(1,1), "11 is free before arrange");
	assert_true(scr_navgrid_cell_is_free(2,2), "22 is free before arrange");

	// arrange
	var begin_x = scr_gi_to_rc(2);
	var begin_y = begin_x;
	var half_i = 3;
	var half_x = scr_gi_to_rc(half_i);
	var half_y = half_x;
	var end_x = scr_gi_to_rc(4);
	var end_y = end_x;

	var astro = instance_create_depth(begin_x,begin_y,0,obj_astronaut);
	var can_go = scr_navigate(astro, end_x, end_y);
	var old_i = 0;
	var old_j = 0;
	with(astro)
	{
		x = half_x;
		y = half_y;
		old_i = occ_i;
		old_j = occ_j;
		occ_i = half_i;
		occ_j = half_i;
		path_position = 0.5;
	}
	scr_navgrid_free(old_i, old_j);

	// act
	var result = scr_cancel_walking(astro);

	// assert
	assert_equal(cancel_walking_result.stop, result, "cancel_walking_result");
	assert_true(can_go, "astronaut can navigate");
	with(astro)
	{
		assert_false(path_exists(path), "path_exists(path)");
		assert_equal(half_x, x, "x");
		assert_equal(half_y, y, "y");
		assert_equal(0, image_speed, "image_speed");
		assert_equal(0, image_index, "image_index");
		assert_equal(1, path_position, "path_position");
	}

	// cleanup
	instance_destroy(astro);

	assert_true(scr_navgrid_cell_is_free(1,1), "11 is free after cleanup");
	assert_true(scr_navgrid_cell_is_free(2,2), "22 is free after cleanup");

	test_result();


}
