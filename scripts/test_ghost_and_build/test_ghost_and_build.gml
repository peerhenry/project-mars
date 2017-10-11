test_init(test_wall_image_index_for_foundation);

// arrange
scr_ghost_reset();

// act
scr_update_ghost_single(10, 10, macro_basetile, 0);
scr_build_new(); // creates the construction

// assert
var btc = 0; // basetile count;
with(obj_base_tile){
	btc = btc + 1;
}
assert_equal(1, btc, "basetile count");
var wallcount = 0;
with(obj_wall){
	wallcount = wallcount + 1;
}
assert_equal(8, wallcount, "wallcount");

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