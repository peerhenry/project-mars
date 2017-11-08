test_init(test_ghost_destruct_four_basetiles);

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
scr_update_ghost_destruct(96, 96, 96, 96, macro_destruct_safe, false);

// assert
var ghost = global.construction_ghost;
var ghost_stack = ghost[?macro_ghost_stack];
var ghost_invalid_stack = ghost[?macro_ghost_invalid_stack];
assert_equal(0, ds_stack_size(ghost_invalid_stack), "invalid ghost stack size");
assert_equal(16, ds_stack_size(ghost_stack), "ghost stack size");

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
assert_equal(0, bt_count, "basetile count");
assert_equal(0, wall_count, "wall count");

// cleanup
scr_ghost_reset();

test_result();