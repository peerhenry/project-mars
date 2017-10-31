test_init(test_ghost_and_build);

// arrange
scr_ghost_reset();

// act
scr_update_ghost_single(10, 10, macro_basetile, 0);
scr_build_new(); // creates the construction

// assert
assert_object_count(1, obj_base_tile);
assert_object_count(8, obj_wall);

// cleanup
with(obj_base_tile){
	instance_destroy();
}
with(obj_wall){
	instance_destroy();
}
var cq = scr_get_construction_queue(macro_player);
ds_list_clear(cq);

test_result();