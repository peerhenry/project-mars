function test_suite_deliver_mdu_after_fetch() {
	test_decr_deliveries_after_fetch();
	test_deliver_mdu_after_fetch();
	test_deliver_mdu_after_fetch_no_constr();


}
