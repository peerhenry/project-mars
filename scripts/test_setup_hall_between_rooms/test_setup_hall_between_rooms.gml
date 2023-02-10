function test_setup_hall_between_rooms() {
	test_init(test_setup_hall_between_rooms);

	scr_setup_room(2,2,2,2);
	scr_setup_room(7,2,2,2);

	// act
	scr_setup_hall(4,2,6,2);

	// assert
	assert_equal(2, scr_count_instances(obj_door), "obj_door count");
	assert_equal(3, scr_count_instances(obj_room), "obj_room count");

	// cleanup
	with(obj_door) instance_destroy();
	with(obj_base_tile) instance_destroy();
	with(obj_wall) instance_destroy();
	with(obj_room) instance_destroy();

	test_result();


}
