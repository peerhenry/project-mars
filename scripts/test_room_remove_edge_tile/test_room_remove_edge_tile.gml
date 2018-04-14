test_init(test_room_remove_edge_tile);

// arrange
var tile1_i = 2;
var tile1_j = 2;
scr_setup_room(tile1_i, tile1_j, 1, 2);

// assert setup
assert_object_count(1, obj_room);
assert_object_count(2, obj_base_tile);

// act
var tx = scr_gi_to_rc(tile1_i);
var ty = scr_gi_to_rc(tile1_j);
var bt_exists = position_meeting(tx, ty, obj_base_tile);
assert_true(bt_exists, "bt_exists")
var bt = instance_position(tx, ty, obj_base_tile);
instance_destroy(bt);

// assert
assert_object_count(1, obj_base_tile);
assert_object_count(1, obj_room);
var rx = scr_gi_to_rc(tile1_i);
var ry = scr_gi_to_rc(tile1_j + 1);
var le_room = scr_room_at(rx, ry);
assert_false(le_room == noone, "le_room == noone");
with(le_room)
{
	var grid = scr_get_grid(id, macro_grid_oxygen);
	assert_equal(1, ds_list_size(tiles), "le_room.tiles size");
	assert_equal(obj_grid, grid.object_index, "grid.object_index");
	assert_equal(rx - 16, bb_left, "bb_left");
	assert_equal(rx + 16, bb_right, "bb_right");
	assert_equal(ry - 16, bb_top, "bb_top");
	assert_equal(ry + 16, bb_bottom, "bb_bottom");
}

// cleanup
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();

// assert cleanup
assert_object_count(0, obj_room);

test_result();