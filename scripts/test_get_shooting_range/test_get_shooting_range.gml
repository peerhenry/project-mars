function test_get_shooting_range() {
	test_init(test_get_shooting_range);

	var astro = instance_create_depth(32, 32, 0, obj_astronaut);
	scr_extract_and_destroy_item_from_entity(astro, inv_space.pistol);

	var result = scr_get_shooting_range(astro);
	assert_equal(0, result, "shooting range");

	instance_destroy(astro);

	test_result();


}
