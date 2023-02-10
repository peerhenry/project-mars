function test_finish_construction_occupies_nav_grid() {
	test_init(test_finish_construction_occupies_nav_grid);

	// arrange
	// setup construction of a sensor
	scr_ghost_reset_with_constr_type(macro_sensor);
	var i = 3;
	var j = 4;
	scr_update_ghost_single(i, j, macro_sensor, 0);
	scr_build_new();
	var construction = scr_get_first_queud_construction(macro_player);
	scr_incr_construction_mdu(global.script_container, construction); // creates obj_construction_mdu_pile

	// assert setup
	assert_false(scr_navgrid_cell_is_free(i, j), "navgrid is free @ setup");
	var queue = scr_get_construction_queue(macro_player);
	assert_equal(1, ds_list_size(queue), "ds_list_size(queue)");
	assert_equal(1, scr_count_instances(obj_sensor), "obj_sensor count");

	// act
	scr_build_complete(construction);

	// assert
	assert_false(scr_navgrid_cell_is_free(i, j), "navgrid is free");

	// cleanup
	scr_destroy_construction(construction);
	with(obj_sensor) instance_destroy();
	assert_equal(0, ds_list_size(queue), "ds_list_size(queue) after cleanup");
	scr_clear_all_construction_queues();

	test_result();


}
