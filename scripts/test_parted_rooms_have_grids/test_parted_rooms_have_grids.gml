test_init(test_parted_rooms_have_grids);

// arrange
var tile1 = instance_create_depth(32,32,0,obj_base_tile);
var tile2 = instance_create_depth(32,64,0,obj_base_tile);
var tile3 = instance_create_depth(32,96,0,obj_base_tile);
with(obj_base_tile)
{
	event_user(macro_event_finalize);
	scr_room_logic_basetile(x, y);
}
assert_false(tile1.under_construction, "tile1.under_construction");
var tile1_grid = scr_get_grid(tile1, macro_grid_oxygen);
var tile2_grid = scr_get_grid(tile2, macro_grid_oxygen);
var tile3_grid = scr_get_grid(tile3, macro_grid_oxygen);
assert_true(tile1_grid > 0, "tile1_grid >= 0");
assert_equal(obj_grid, tile1_grid.object_index, "tile1_grid.object_index");
assert_equal(tile1_grid, tile2_grid, "tile2_grid");
assert_equal(tile1_grid, tile3_grid, "tile3_grid");
var room_count = 0;
with(obj_room)
{
	room_count++;
}
assert_equal(1, room_count, "room_count");
var el_room = scr_room_at(32, 32);
var room_grid = scr_get_grid(el_room, macro_grid_oxygen);
assert_equal(tile1_grid, room_grid, "room_grid");

// act
instance_destroy(tile2);

// assert
var room1 = scr_room_at(32, 32);
var room2 = scr_room_at(32, 96);
assert_true(room1 != room2, "room1 != room2");
assert_equal(1, ds_list_size(room1.tiles), "room1 tiles count");
assert_equal(1, ds_list_size(room2.tiles), "room2 tiles count");
var grid1 = scr_get_grid(room1, macro_grid_oxygen);
var grid2 = scr_get_grid(room2, macro_grid_oxygen);
assert_true(grid1 > 0, "grid1 > 0");
assert_true(grid2 > 0, "grid2 > 0");
assert_true(grid1 != grid2, "grid1 != grid2");
assert_equal(obj_grid, grid1.object_index, "grid1.object_index");
assert_equal(obj_grid, grid2.object_index, "grid2.object_index");
assert_false(scr_can_draw_from_grid(room1, macro_grid_oxygen), "room1 can draw from grid");
assert_false(scr_can_draw_from_grid(room2, macro_grid_oxygen), "room2 can draw from grid");

// cleanup
instance_destroy(tile1);
instance_destroy(tile3);

test_result();