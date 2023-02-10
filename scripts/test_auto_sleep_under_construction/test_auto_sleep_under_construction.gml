function test_auto_sleep_under_construction() {
	test_init(test_auto_sleep_under_construction);

	// arrange
	var astro = instance_create_depth(32,32,0,obj_astronaut);
	astro.wears_suit = false;
	astro.sleep_level = astro.auto_sleep_level - 1;
	var bed = instance_create_depth(200,200,0,obj_bed);
	bed.under_construction = true;
	// act
	var result = scr_auto_sleep(astro);
	// assert
	assert_false(result, "auto sleep result");
	// cleanup
	instance_destroy(astro);
	instance_destroy(bed);

	test_result();


}
