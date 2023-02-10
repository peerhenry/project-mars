function test_auto_sleep_suit() {
	test_init(test_auto_sleep_suit);

	// arrange
	var astro = instance_create_depth(32,32,0,obj_astronaut);
	var bed = instance_create_depth(200,200,0,obj_bed);
	astro.sleep_level = astro.auto_sleep_level - 1;
	astro.wears_suit = true;
	bed.under_construction = false;
	// act
	var result = scr_auto_sleep(astro);
	// assert
	assert_true(result, "auto sleep result");
	// cleanup
	instance_destroy(astro);
	instance_destroy(bed);

	test_result();


}
