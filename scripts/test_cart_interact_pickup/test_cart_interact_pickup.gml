test_init(test_cart_interact_pickup);

// arrange
var xx = scr_gi_to_rc(20);
var yy = scr_gi_to_rc(20);
var cart = instance_create_depth(xx, yy, 0, obj_cart);
var pump = instance_create_depth(xx + 64, yy + 64, 0, obj_pump);
var pickup_i = pump.occ_i;
var pickup_j = pump.occ_j;
with(cart)
{
	deploy = false;
	action = cart_action.pickup;
	assigned_instance = pump;
}

// assert setup
var map_value = scr_map_buffer_get_cell(pickup_i, pickup_j);
var map_o = (map_value >> 1) & 127; // next 7 bytes store o
assert_equal(map_value_occupied, map_o, "map_value");
assert_false(scr_navgrid_cell_is_free(pickup_i, pickup_j), "navgrid is free");

// act
scr_end_path_action_cart(cart);

// assert
assert_equal(pump, cart.carrying_instance, "carrying instance");
assert_equal(cart.occ_i, pump.occ_i, "pump.occ_i");
assert_equal(cart.occ_j, pump.occ_j, "pump.occ_j");
map_value = scr_map_buffer_get_cell(pickup_i, pickup_j);
map_o = (map_value >> 1) & 127; // next 7 bytes store o
assert_equal(map_value_vacant, map_o, "map_value");
assert_true(scr_navgrid_cell_is_free(pickup_i, pickup_j), "navgrid is free");

// cleanup
instance_destroy(cart);

test_result();