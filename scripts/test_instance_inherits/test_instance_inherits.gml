function test_instance_inherits() {
	test_init(test_instance_inherits);

	assert_false(object_is_ancestor(obj_cart, obj_cart), "object_is_ancestor(obj_cart, obj_cart)");

	var cart = instance_create_depth(0,0,0,obj_cart);
	assert_true(scr_instance_inherits(cart, obj_cart), "scr_instance_inherits(cart, obj_cart)");
	assert_true(scr_instance_inherits(cart, obj_movable), "scr_instance_inherits(cart, obj_movable)");
	assert_false(scr_instance_inherits(cart, obj_task_actor), "scr_instance_inherits(cart, obj_task_actor)");
	instance_destroy(cart);

	test_result();


}
