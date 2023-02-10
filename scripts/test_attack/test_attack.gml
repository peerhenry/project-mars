function test_attack() {
	test_init(test_attack);

	// arrange
	var astro = instance_create_depth(32,32,0,obj_astronaut);
	var enemy = scr_create_astronaut_safe(128, 128, macro_enemy);

	// act
	var can_attack = scr_attack(astro, enemy);

	// assert
	assert_true(can_attack, "can_attack");
	assert_equal(enemy, astro.target, "target");

	// cleanup
	instance_destroy(astro);
	instance_destroy(enemy);

	test_result();


}
