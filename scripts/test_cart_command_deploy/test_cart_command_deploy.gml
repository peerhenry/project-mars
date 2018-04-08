test_init(test_cart_command_deploy);

// arrange
var cart = instance_create_depth(64,64,0,obj_cart);
cart.carrying_instance = instance_create_depth(64,64,0,obj_pump);
cart.is_selected = true;
cart.deploy = true;

// act
var result = scr_command_cart_deploy(cart, 128, 128);

// assert
assert_true(result, "can deploy");
assert_equal(cart_action.deploy, cart.action, "cart action");

// cleanup
instance_destroy(cart);

test_result();