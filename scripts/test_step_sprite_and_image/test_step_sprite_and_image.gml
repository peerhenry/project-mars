function test_step_sprite_and_image() {
	test_init(test_step_sprite_and_image);
	//arrange
	var astro = instance_create_depth(0,0,0,obj_astronaut);
	// act
	scr_step_sprite_and_image(astro);
	// assert
	with(astro){
		assert_equal(0, image_speed, "image_speed ");
		assert_equal(0, image_index, "image_index ");
	}
	//cleanup
	instance_destroy(astro);
	test_result();


}
