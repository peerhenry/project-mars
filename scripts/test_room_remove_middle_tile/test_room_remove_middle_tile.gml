test_init(test_room_remove_middle_tile);

// arrange
var ii = 2;
var jj = 2;
scr_setup_room(ii,jj,1,3);

// act
var tx = scr_gi_to_rc(ii);
var ty = scr_gi_to_rc(jj+1);
var bt = instance_position(tx, ty, obj_base_tile);
instance_destroy(bt);

// assert
assert_object_count(2, obj_room);

var rx = scr_gi_to_rc(ii);
var ry = scr_gi_to_rc(jj+2);
var le_room = scr_room_at(rx, ry);
assert_false(le_room == noone, "le_room == noone");
with(le_room)
{	
	var grid = scr_get_grid(id, macro_grid_oxygen);
	assert_equal(obj_grid, grid.object_index, "grid.object_index");
	assert_equal(1, ds_list_size(tiles), "le_room.tiles size");
	assert_equal(rx - 16, bb_left, "bb_left");
	assert_equal(rx + 16, bb_right, "bb_right");
	assert_equal(ry - 16, bb_top, "bb_top");
	assert_equal(ry + 16, bb_bottom, "bb_bottom");
}

ry = scr_gi_to_rc(jj);
var le_room_top = scr_room_at(rx, ry);
assert_false(le_room_top == noone, "le_room == noone");
assert_false(le_room == le_room_top, le_room == le_room_top);
with(le_room_top)
{	
	var grid = scr_get_grid(id, macro_grid_oxygen);
	assert_equal(obj_grid, grid.object_index, "grid.object_index");
	assert_equal(1, ds_list_size(tiles), "le_room_top.tiles size");
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