function test_suite_scenarios_construction() {
	test_run(test_hatch_clears_navgrid);
	test_run(test_finish_closet_occupies_navgrid);
	test_run(test_finish_closet_with_mdus);

	test_suite_destruct();


}
