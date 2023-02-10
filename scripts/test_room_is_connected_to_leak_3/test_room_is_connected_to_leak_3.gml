function test_room_is_connected_to_leak_3() {
	// one room, open hatch
	test_init(test_room_is_connected_to_leak_3);

	// arrange
	var hatch = instance_create_depth(0,0,0,obj_hatch);
	var base_room = instance_create_depth(0,0,0,obj_room);
	hatch.is_open = true;
	ds_list_add(base_room.hatches, hatch);
	var aggr = ds_list_create();

	// act
	var result = scr_room_is_connected_to_leak(base_room, aggr);

	// assert
	assert_true(result, "oxygen_is_leaking");

	// cleanup
	ds_list_destroy(aggr);
	with(hatch) instance_destroy();
	with(base_room) instance_destroy();

	test_result();


}
