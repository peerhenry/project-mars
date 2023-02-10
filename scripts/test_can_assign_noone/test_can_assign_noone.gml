function test_can_assign_noone() {
	test_init(test_can_assign_noone);

	var astro = instance_create_depth(32,32,0,obj_astronaut);
	var result = scr_can_assign(noone, astro);
	assert_false(result, "can assign");
	instance_destroy(astro);

	test_result();


}
