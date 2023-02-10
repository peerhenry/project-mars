function test_room_cannot_part_here() {
	test_init(test_room_cannot_part_here);

	// arrange
	var le_room = instance_create_depth(0,0,0,obj_room);
	scr_add_tile_to_room(le_room, 1, 0);
	scr_add_tile_to_room(le_room, 1, 1);
	scr_add_tile_to_room(le_room, 1, 2);
	scr_add_tile_to_room(le_room, 1, 3);
	scr_add_tile_to_room(le_room, 0, 2);

	// act
	var r1 = scr_room_cannot_part_here(le_room, 1, 0);
	assert_true(r1, "r1");
	var r2 = scr_room_cannot_part_here(le_room, 1, 1);
	assert_false(r2, "r2");
	var r3 = scr_room_cannot_part_here(le_room, 1, 2);
	assert_false(r3, "r3");
	var r4 = scr_room_cannot_part_here(le_room, 1, 3);
	assert_true(r4, "r4");
	var r5 = scr_room_cannot_part_here(le_room, 0, 2);
	assert_true(r5, "r5");

	// cleanup
	instance_destroy(le_room);

	test_result();


}
