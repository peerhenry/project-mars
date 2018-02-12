test_init(test_remove_tile_from_room_bb);

// arrange
var le_room = instance_create_depth(0,0,0,obj_room);
var mini = scr_gi_to_rc(2) - 16;
var maxi = scr_gi_to_rc(4) + 16;
var init_left = mini;
var init_right = maxi;
var init_top = mini;
var init_bottom = maxi;
with(le_room)
{
	ds_list_add(tiles, scr_encode_grid_coord(2,2));
	ds_list_add(tiles, scr_encode_grid_coord(3,3));
	ds_list_add(tiles, scr_encode_grid_coord(4,4));
	bb_left = init_left;
	bb_top = init_top;
	bb_right = init_right;
	bb_bottom = init_bottom;
}

// act
scr_remove_tile_from_room(le_room, 2, 2);
// assert
with(le_room)
{
	assert_equal(mini + 32, bb_left, "bb_left");
	assert_equal(init_right, bb_right, "bb_right");
	assert_equal(mini + 32, bb_top, "bb_top");
	assert_equal(init_bottom, bb_bottom, "bb_bottom");
}

// act
scr_remove_tile_from_room(le_room, 4, 4);
// assert
with(le_room)
{
	assert_equal(mini + 32, bb_left, "bb_left");
	assert_equal(maxi - 32, bb_right, "bb_right");
	assert_equal(mini + 32, bb_top, "bb_top");
	assert_equal(maxi - 32, bb_bottom, "bb_bottom");
}

// cleanup
instance_destroy(le_room);

test_result();