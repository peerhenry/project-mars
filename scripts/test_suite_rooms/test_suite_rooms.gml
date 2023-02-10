function test_suite_rooms() {
	test_room_step();
	test_parted_rooms_have_grids();
	test_room_is_connected_to_leak_1();
	test_room_is_connected_to_leak_2();
	test_room_is_connected_to_leak_3();
	test_room_is_connected_to_leak_4();
	test_closing_door_plugs_leak();
	test_closing_hatch_plugs_leak();
	test_remove_tile_from_room_bb();


}
