test_init(test_cart_command_pickup);

// arrange
var cart = instance_create_depth(64, 64, 0, obj_cart);
cart.is_selected = true;
var pump = instance_create_depth(128, 128, 0, obj_pump);
pump.under_construction = false;

// act
scr_command(pump.x, pump.y);

// assert
assert_equal(cart_action.pickup, cart.action, "cart action");
assert_equal(pump, cart.assigned_instance, "assigned instance");

// cleanup
with(obj_command) instance_destroy(); // todo: prevent this thing from being created in the first place.
instance_destroy(cart);
instance_destroy(pump);

test_result();