function test_suite_navigation() {
	test_stop_moving();
	test_cancel_walking();
	test_cancel_walking_move_to_center();
	test_get_approximate_direction();
	test_get_adjacent_cell_in_direction();
	test_navigate_with_retries();
	test_navgrid_should_clear_after_astro_pass();
	test_navigate_through_door_other_owner();
	test_two_astronauts_dont_go_to_same_spot();


}
