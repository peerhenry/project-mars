test_init(test_cart_command_pickup_under_construction);

// arrange
var xx = scr_gi_to_rc(20);
var yy = scr_gi_to_rc(20);
var cart = instance_create_depth(xx, yy, 0, obj_cart);
cart.is_selected = true;
cart.action = cart_action.idle;
var pump = instance_create_depth(xx + 64, yy + 64, 0, obj_pump);
pump.under_construction = true;

// act
scr_command(pump.x, pump.y);

// assert
assert_equal(cart_action.move, cart.action, "cart action");
assert_equal(noone, cart.assigned_instance, "assigned instance");

// cleanup
instance_destroy(cart);
instance_destroy(pump);

test_result();