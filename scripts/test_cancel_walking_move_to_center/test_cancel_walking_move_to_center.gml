function test_cancel_walking_move_to_center() {
	test_init(test_cancel_walking_move_to_center);

	assert_true(scr_navgrid_cell_is_free(1,1), "11 is free before arrange");
	assert_true(scr_navgrid_cell_is_free(2,2), "22 is free before arrange");

	assert_true(instance_number(obj_movable) == 0, "no obj_movable @ test begin");
	assert_true(instance_number(obj_gate) == 0, "no gate @ test begin");
	assert_true(scr_navgrid_cell_is_free(0, 1), "01 is free");
	assert_true(scr_navgrid_cell_is_free(1, 1), "11 is free");
	assert_true(scr_navgrid_cell_is_free(2, 1), "21 is free");
	assert_true(scr_navgrid_cell_is_free(3, 1), "31 is free");

	// arrange
	var from = 64;
	var to = from + 96;
	var third = from + 32;
	var fourth = from + 24;
	var c_y = 64; // keep y constant

	var astro = instance_create_depth(from, c_y, 0, obj_astronaut);
	var can_go = scr_navigate(astro, to, c_y);
	var old_i = 0;
	var old_j = 0;
	with(astro)
	{
		x = fourth;
		y = c_y;
		old_i = occ_i;
		old_j = occ_j;
		occ_i = scr_rc_to_gi(x);
		occ_j = scr_rc_to_gi(y);
		path_position = 0.25;
	}
	scr_navgrid_free(old_i, old_j);

	// assert setup
	var le_path = astro.path;
	assert_equal(96, path_get_length(le_path), "path length");
	assert_equal(path_get_x(le_path, 0), from, "from of path");
	assert_equal(path_get_x(le_path, 1), to, "to of path");
	assert_equal(path_get_x(le_path, 0.25), fourth, "fourth of path");
	assert_equal(path_get_y(le_path, 0.25), c_y, "fourth of path y");
	assert_approximate(path_get_x(le_path, 0.33333), third, 0.001, "third of path");
	assert_equal(path_get_y(le_path, 0.33333), c_y, "third of path y");
	assert_equal(scr_rc_to_gi(to), astro.dest_i, "dest_i");

	// act
	var result = scr_cancel_walking(astro);

	// assert
	assert_true(can_go, "can_go");
	assert_equal(cancel_walking_result.move_to_center, result, "cancel walking result");
	with(astro)
	{
		var has_path = path_exists(path);
		assert_true(has_path, "has_path");
		if(has_path)
		{
			assert_true(path_exists(path), "path_exists(path)");
			assert_equal(fourth, x, "x");
			assert_equal(c_y, y, "y");
			assert_equal(0, path_position, "path_position");
			assert_equal(movement_speed, path_speed, "path_position");
			assert_equal(scr_rc_to_gi(third), astro.dest_i, "dest_i");
			assert_equal(third, path_get_x(path, 1), "path dest x");
			assert_equal(c_y, path_get_y(path, 1), "path dest y");
		}
	}

	// cleanup
	instance_destroy(astro);

	test_result();


}
