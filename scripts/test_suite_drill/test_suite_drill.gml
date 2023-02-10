function test_suite_drill() {
	test_message("Running test_suite_drill");

	test_drill_acquire_resource();
	test_drill_should_destroy_depleted_resource();
	test_drill_should_dump_in_bucket();


}
