test_init(test_split_room_with_destruct_safe);

// arrange
global.resource_amount_metal = 100000;
var container = global.script_container;
script_container_register(container, "room_logic_basetile", scr_room_logic_basetile);
scr_update_ghost(64, 64, 192, 64, macro_basetile, 0, true);
scr_build_new();
debug_finish_all_constructions();
// assert setup
assert_object_count(5, obj_base_tile);
assert_object_count(16, obj_wall);
var room_count = 0;
with(obj_room)
{
	room_count++;
	var grid = scr_get_grid(id, macro_grid_oxygen);
	assert_equal(obj_grid, grid.object_index, "grid.object_index");
}
assert_equal(1, room_count, "room_count");
assert_object_count(macro_grid_type_count, obj_grid);

// act
scr_update_ghost(128, 64, 128, 64, macro_destruct_safe, 0, true);
scr_build_new();
debug_finish_all_constructions();

// assert
assert_object_count(2, obj_base_tile);
assert_object_count(16, obj_wall);
assert_object_count(macro_grid_type_count * 2, obj_grid);
assert_object_count(2, obj_room);
with(obj_room)
{
	var grid = scr_get_grid(id, macro_grid_oxygen);
	assert_equal(obj_grid, grid.object_index, "grid.object_index");
}

// cleanup
script_container_register(container, "room_logic_basetile", scr_mock);
with(obj_wall)
{
	instance_destroy();
}
with(obj_base_tile)
{
	instance_destroy();
}

test_result();