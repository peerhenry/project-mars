function test_suite_construction() {
	test_message("running test_suite_construction");

	test_new_construction();
	test_cancel_construction();
	test_cancel_construction_with_piles();
	test_obj_destruct();
	test_register_new_construction();
	test_ghost_and_build();
	test_ghost_and_build_is_in_queue();
	test_wall_image_index_for_foundation();
	test_suite_update_ghost_destruct();
	test_room_cannot_part_here();
	test_suite_destruction();
	test_finish_construction_occupies_nav_grid();
	test_ghost_ownership_matches();
	test_ghost_ownership_does_not_match();


}
