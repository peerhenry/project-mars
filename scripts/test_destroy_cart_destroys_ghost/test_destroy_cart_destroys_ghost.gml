function test_destroy_cart_destroys_ghost() {
	test_init(test_destroy_cart_destroys_ghost);

	// arrange
	var cart = instance_create_depth(64, 64, 0, obj_cart);
	var pump = instance_create_depth(64, 64, 0, obj_pump);
	cart.deploy_ghost = pump;

	// assert setup
	assert_true(instance_exists(cart.deploy_ghost), "deploy ghost exists");

	// act
	instance_destroy(cart);

	// assert
	assert_false(instance_exists(pump), "deploy ghost does not exist");

	// cleanup

	test_result();


}
