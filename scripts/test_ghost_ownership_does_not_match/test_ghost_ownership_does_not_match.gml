test_init(test_ghost_ownership_does_not_match);

// arrange
scr_ghost_reset_with_constr_type(macro_basetile);

// act
global.ownership_behavior = macro_ownership_default;
global.default_owner = macro_enemy;
scr_update_ghost_single(10, 10, macro_basetile, 0);
scr_build_new(); // creates the construction
debug_finish_all_constructions();

global.default_owner = macro_player;
scr_update_ghost_single(10, 10, macro_oxygen_tank, 0);
scr_build_new(); // creates the construction

// assert
assert_equal(macro_ownership_default, global.ownership_behavior, "global.ownership_behavior");
assert_false(global.init_stage, "assert global.init_stage is false");
assert_object_count(0, obj_oxygen_tank);
assert_object_count(1, obj_base_tile);
with(obj_base_tile) assert_equal(macro_enemy, owner, "base_tile owner is enemy");
assert_object_count(8, obj_wall);

// cleanup
with(obj_base_tile)	instance_destroy();
with(obj_wall) instance_destroy();
var cq = scr_get_construction_queue(macro_player);
ds_list_clear(cq);
scr_ghost_reset();

test_result();