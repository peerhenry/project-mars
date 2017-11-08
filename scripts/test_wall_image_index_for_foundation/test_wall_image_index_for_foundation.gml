test_init(test_wall_image_index_for_foundation);

scr_ghost_reset_with_constr_type(macro_basetile);

// Act
//   first basetile construction
scr_update_ghost_single(10, 10, macro_basetile, 0);
scr_build_new(); // creates the construction
var basetile = scr_get_instance_at_ij(10, 10, obj_base_tile);
basetile.room_logic = scr_mock;
var cq = scr_get_construction_queue(macro_player);
var constr1 = ds_list_find_value(cq, 0);
scr_build_complete(constr1);
//   second basetile construction
scr_ghost_reset_with_constr_type(macro_basetile);
scr_update_ghost_single(11, 10, macro_basetile, 0);
scr_build_new();
var constr2 = ds_list_find_value(cq, 0);
scr_build_complete(constr2);

// assert
var btc = 0;
with(obj_base_tile)
{
	btc += 1;
}
assert_equal(2, btc, "basetile count");
var wallcount = 0;
with(obj_wall)
{
	wallcount += 1;
}
assert_equal(10, wallcount, "wallcount");
// assert all wall image indices
var expect_EW = scr_from_4_bits(0,1,0,1);
var expect_NS = scr_from_4_bits(1,0,1,0);
var expect_SW = scr_from_4_bits(1,1,0,0);
var expect_SE = scr_from_4_bits(1,0,0,1);
var expect_NW = scr_from_4_bits(0,1,1,0);
var expect_NE = scr_from_4_bits(0,0,1,1);
var w1 = scr_get_instance_at_ij(9, 9, obj_wall); // ENWS
assert_equal(expect_SE, w1.image_index, "w1 image index");
var w2 = scr_get_instance_at_ij(10, 9, obj_wall);
assert_equal(expect_EW, w2.image_index, "w2 image index");
var w3 = scr_get_instance_at_ij(11, 9, obj_wall);
assert_equal(expect_EW, w3.image_index, "w3 image index");
var w4 = scr_get_instance_at_ij(12, 9, obj_wall);
assert_equal(expect_SW, w4.image_index, "w4 image index");
var w5 = scr_get_instance_at_ij(9, 10, obj_wall);
assert_equal(expect_NS, w5.image_index, "w5 image index");
var w6 = scr_get_instance_at_ij(12, 10, obj_wall);
assert_equal(expect_NS, w6.image_index, "w6 image index");
var w7 = scr_get_instance_at_ij(9, 11, obj_wall);
assert_equal(expect_NE, w7.image_index, "w7 image index");
var w8 = scr_get_instance_at_ij(10, 11, obj_wall);
assert_equal(expect_EW, w8.image_index, "w8 image index");
var w9 = scr_get_instance_at_ij(11, 11, obj_wall);
assert_equal(expect_EW, w9.image_index, "w9 image index");
var w10 = scr_get_instance_at_ij(12, 11, obj_wall);
assert_equal(expect_NW, w10.image_index, "w10 image index");

// cleanup
with(obj_base_tile)
{
	instance_destroy();
}
with(obj_wall)
{
	instance_destroy();
}
ds_list_clear(cq);
scr_destroy_construction(constr1);
scr_destroy_construction(constr2);
scr_ghost_reset();

test_result();