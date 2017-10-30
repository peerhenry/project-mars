test_init(test_ghost_nine_basetiles_destruct_corner);

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
scr_ghost_reset();

// act
scr_update_ghost_destruct(64, 64, 64, 64, macro_destruct_safe, false);

// assert
var stack = global.ghost_stack;
assert_equal(0, ds_stack_size(global.invalid_ghost_stack), "invalid ghost stack size");
assert_equal(7, ds_stack_size(stack), "ghost stack size");

// act
scr_build_new();
debug_finish_all_constructions();

// assert
var bt_count = 0;
var wall_count = 0;
with(obj_base_tile)
{
	bt_count++;
}
with(obj_wall)
{
	wall_count++;
}
assert_equal(5, bt_count, "basetile count");
assert_equal(16, wall_count, "wall count");

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