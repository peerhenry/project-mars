test_init(test_destroy_from_damage_wall_door);

// arrange
scr_setup_room(3,3,1,5);
scr_setup_door(3,5,0);

// assert setup
assert_object_count(1, obj_door);
assert_object_count(2, obj_room);

// act
var wx = scr_gi_to_rc(2);
var wy = scr_gi_to_rc(5);
var wall = instance_position(wx, wy, obj_wall);
scr_destroy_from_damage(wall);

// assert
var room_1 = noone;
var room_2 = noone;
with(obj_door)
{
	room_1 = room1;
	room_2 = room2;
}
assert_equal(1, ds_list_size(room_1.leaks), "ds_list_size(room_1.leaks)");
assert_equal(1, ds_list_size(room_2.leaks), "ds_list_size(room_2.leaks)");

// cleanup
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();
with(obj_door) instance_destroy();

// assert cleanup
assert_object_count(0, obj_room);

test_result();