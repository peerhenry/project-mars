function test_suite_combat() {
	// suites
	test_suite_can_shoot();
	// tests
	test_get_shooting_range();
	test_target_is_within_range();
	test_alarm_shoot();
	test_alarm_shoot_target();
	test_attack();
	test_pursue_target();
	test_points_are_within_range();
	test_move_command_should_cancel_combat();
	test_create_corpse_with_suit();
	test_create_corpse_without_suit();


}
