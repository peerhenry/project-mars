test_init(test_ghost_nine_basetiles_destruct_center);

// arrange
// 9 basetiles surrounded by 16 walls
instance_create_depth(64, 64, 0, obj_base_tile);
instance_create_depth(64, 96, 0, obj_base_tile);
instance_create_depth(64, 128, 0, obj_base_tile);
instance_create_depth(96, 64, 0, obj_base_tile);
instance_create_depth(96, 96, 0, obj_base_tile);
instance_create_depth(96, 128, 0, obj_base_tile);
instance_create_depth(128, 64, 0, obj_base_tile);
instance_create_depth(128, 96, 0, obj_base_tile);
instance_create_depth(128, 128, 0, obj_base_tile);

instance_create_depth(32, 32, 0, obj_wall);
instance_create_depth(64, 32, 0, obj_wall);
instance_create_depth(96, 32, 0, obj_wall);
instance_create_depth(128, 32, 0, obj_wall);
instance_create_depth(160, 32, 0, obj_wall);

instance_create_depth(32, 160, 0, obj_wall);
instance_create_depth(64, 160, 0, obj_wall);
instance_create_depth(96, 160, 0, obj_wall);
instance_create_depth(128, 160, 0, obj_wall);
instance_create_depth(160, 160, 0, obj_wall);

instance_create_depth(32, 64, 0, obj_wall);
instance_create_depth(32, 96, 0, obj_wall);
instance_create_depth(32, 128, 0, obj_wall);
instance_create_depth(160, 64, 0, obj_wall);
instance_create_depth(160, 96, 0, obj_wall);
instance_create_depth(160, 128, 0, obj_wall);

// act
scr_ghost_reset();
scr_update_ghost_destruct(96, 96, 96, 96, macro_destruct_safe, false);

// assert
assert_equal(0, ds_stack_size(global.invalid_ghost_stack), "invalid ghost stack size");
assert_equal(25, ds_stack_size(global.ghost_stack), "ghost stack size");

// cleanup
with(obj_base_tile)
{
	instance_destroy();
}
with(obj_wall)
{
	instance_destroy();
}
scr_ghost_reset();

test_result();