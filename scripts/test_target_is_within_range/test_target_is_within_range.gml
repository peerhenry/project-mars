function test_target_is_within_range() {
	test_init(test_target_is_within_range);

	// 1. Within range

	// arrange
	var shooter = instance_create_depth(0,0,0, obj_astronaut);
	var pistol = scr_give_entity_new_item(shooter, inv_space.pistol);
	var target = instance_create_depth(pistol.range*32 - 1,0,0, obj_astronaut);

	// act
	var result = scr_target_is_within_range(shooter, target);

	// assert
	assert_true(result, "within range");

	// 2. Outside range

	// act
	target.x = pistol.range*32 + 1;
	var result = scr_target_is_within_range(shooter, target);

	// assert
	assert_false(result, "within range");

	// cleanup
	instance_destroy(shooter);
	instance_destroy(target);

	// result
	test_result();


}
