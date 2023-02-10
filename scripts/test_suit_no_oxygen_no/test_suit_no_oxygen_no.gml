function test_suit_no_oxygen_no() {
	test_init(test_suit_no_oxygen_no);
	// arrange
	var astro = instance_create_depth(0,0,0,obj_astronaut);
	var expect_health = astro.entity_health - global.suffocation_speed;
	astro.wears_suit = false;
	// act
	scr_step_oxygen_and_health(astro);
	// assert
	with astro
	{
		assert_equal(expect_health, entity_health, "astronaut health");
	}
	//cleanup
	instance_destroy(astro);
	test_result();


}
