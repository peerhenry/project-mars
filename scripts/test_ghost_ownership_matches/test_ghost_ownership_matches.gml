test_init(test_ghost_ownership_matches);

// arrange
scr_ghost_reset_with_constr_type(macro_basetile);

// act
scr_update_ghost_single(10, 10, macro_basetile, 0);
scr_build_new(); // creates the construction
debug_finish_all_constructions();

scr_update_ghost_single(10, 10, macro_oxygen_tank, 0);
scr_build_new(); // creates the construction

// assert
assert_object_count(1, obj_oxygen_tank);
assert_object_count(1, obj_base_tile);
assert_object_count(8, obj_wall);
with(obj_oxygen_tank)
{
	assert_equal(macro_player, owner, "owner is player");
}

// cleanup
with(obj_base_tile)	instance_destroy();
with(obj_wall) instance_destroy();
with(obj_oxygen_tank) instance_destroy();
var cq = scr_get_construction_queue(macro_player);
ds_list_clear(cq);
scr_ghost_reset();

test_result();