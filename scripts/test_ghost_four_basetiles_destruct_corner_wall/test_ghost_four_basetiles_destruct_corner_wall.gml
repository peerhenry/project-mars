test_init(test_ghost_four_basetiles_destruct_corner_wall);

// arrange
// 4 basetiles surrounded by 12 walls
instance_create_depth(64, 64, 0, obj_base_tile);
instance_create_depth(64, 96, 0, obj_base_tile);
instance_create_depth(96, 64, 0, obj_base_tile);
instance_create_depth(96, 96, 0, obj_base_tile);

instance_create_depth(32, 32, 0, obj_wall);
instance_create_depth(64, 32, 0, obj_wall);
instance_create_depth(96, 32, 0, obj_wall);
instance_create_depth(128, 32, 0, obj_wall);
instance_create_depth(32, 128, 0, obj_wall);
instance_create_depth(64, 128, 0, obj_wall);
instance_create_depth(96, 128, 0, obj_wall);
instance_create_depth(128, 128, 0, obj_wall);
instance_create_depth(32, 64, 0, obj_wall);
instance_create_depth(128, 64, 0, obj_wall);
instance_create_depth(32, 96, 0, obj_wall);
instance_create_depth(128, 96, 0, obj_wall);

with(obj_base_tile) under_construction = false;
with(obj_wall) under_construction = false;

// act
scr_ghost_reset_with_constr_type(macro_destruct_safe);
scr_update_ghost_destruct(32, 32, 32, 32, macro_destruct_safe, false);

// assert
var ghost = global.construction_ghost;
var ghost_stack = ghost[?macro_ghost_stack];
var ghost_invalid_stack = ghost[?macro_ghost_invalid_stack];
assert_equal(0, ds_stack_size(ghost_invalid_stack), "invalid ghost stack size");
assert_equal(2, ds_stack_size(ghost_stack), "ghost stack size");

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