test_init(test_cart_deploy);

// arrange
var cart = instance_create_depth(64,64,0,obj_cart);
var carry_pump = instance_create_depth(32, 64, 0, obj_pump);
var ghost_pump = instance_create_depth(128, 128, 0, obj_pump);
var expect_i = ghost_pump.occ_i;
var expect_j = ghost_pump.occ_j;
with(cart)
{
	is_selected = true;
	carrying_instance = carry_pump;
	deploy_ghost = ghost_pump;
	action = cart_action.deploy;
}

// act
scr_end_path_action_cart(cart);

// assert
assert_equal(expect_i, carry_pump.occ_i, "carry_pump.occ_i");
assert_equal(expect_j, carry_pump.occ_j, "carry_pump.occ_j");
assert_equal(noone, cart.carrying_instance, "cart.carrying_instance");
assert_equal(noone, cart.deploy_ghost, "cart.deploy_ghost");
assert_false(instance_exists(ghost_pump), "ghost_pump exists");

// cleanup
instance_destroy(cart);
instance_destroy(carry_pump);

test_result();