function test_suite_cart() {
	test_destroy_cart_destroys_carrying_instance();
	test_destroy_cart_destroys_ghost();
	test_cart_command_move();
	test_cart_command_pickup();
	test_cart_command_pickup_under_construction();
	test_cart_command_deploy();
	test_cart_interact_pickup();
	test_cart_deploy();
	test_cart_deploy_cables();
	test_cart_deploy_grid();
	test_cart_pickup_cables();
	test_cart_pickup_grid();


}
