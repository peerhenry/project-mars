function test_setup_room() {
	test_init(test_setup_room);

	// arrange

	// assert setup
	assert_equal(macro_ownership_default, global.ownership_behavior, "ownership behavior");
	assert_equal(macro_player, global.default_owner, "default owner");

	// act
	scr_setup_room(1,2,10,10);

	// assert
	var tile_count = scr_count_instances(obj_base_tile);
	assert_equal(100, tile_count, "tile_count");
	var wall_count = scr_count_instances(obj_wall);
	assert_equal(44, wall_count, "wall_count");
	var room_count = scr_count_instances(obj_room);
	assert_equal(1, room_count, "room_count");

	// cleanup
	with(obj_base_tile) instance_destroy();
	with(obj_wall) instance_destroy();
	with(obj_room) instance_destroy();

	test_result();


}
