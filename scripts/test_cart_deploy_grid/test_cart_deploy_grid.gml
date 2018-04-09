test_init(test_cart_deploy_grid);

// arrange
scr_setup_finished_constructable(20, 12, macro_cable);
var xx = scr_gi_to_rc(20);
var yy = scr_gi_to_rc(10);
var cart = instance_create_depth(xx, yy, 0, obj_cart);
var carry_sensor = instance_create_depth(xx, yy - 32, 0, obj_sensor);
var ghost_sensor = instance_create_depth(xx, yy + 32, 0, obj_sensor);

with(cart)
{
	is_selected = true;
	carrying_instance = carry_sensor;
	deploy_ghost = ghost_sensor;
	action = cart_action.deploy;
}

// assert setup
assert_equal(1, scr_count_instances(obj_grid), "obj_grid count");
with(obj_grid)
{
	assert_equal(1, ds_list_size(tile_key_list), "grid components");
}

// act
scr_end_path_action_cart(cart); // deploy

// assert
assert_equal(1, scr_count_instances(obj_grid), "obj_grid count");
with(obj_grid)
{
	assert_equal(2, ds_list_size(tile_key_list), "grid components");
}

// cleanup
instance_destroy(cart);
with(obj_constructable) instance_destroy();

test_result();