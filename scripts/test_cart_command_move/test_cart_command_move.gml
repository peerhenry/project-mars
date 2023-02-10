function test_cart_command_move() {
	test_init(test_cart_command_move);

	// arrange
	var cart = instance_create_depth(64, 64, 0, obj_cart);
	cart.is_selected = true;

	// act
	scr_command(128, 128);

	// assert
	assert_equal(cart_action.move, cart.action, "cart action");

	// cleanup
	with(obj_command) instance_destroy(); // todo: prevent this thing from being created in the first place.
	instance_destroy(cart);

	test_result();


}
