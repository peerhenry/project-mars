test_init(test_room_is_connected_to_leak_4);

// arrange
var door = instance_create_depth(0,0,0,obj_door);
var room1 = instance_create_depth(0,0,0,obj_room);
var room2 = instance_create_depth(0,0,0,obj_room);
room1.has_proper_leak = true;

door.room1 = room1;
ds_list_add(room1.doors, door);
door.room2 = room2;
ds_list_add(room2.doors, door);
door.is_open = true;
var aggr = ds_list_create();

// act
var result = scr_room_is_connected_to_leak(room2, aggr);

// assert
assert_true(result, "room2 is connected to leak");

// cleanup
ds_list_destroy(aggr);
with(obj_room) instance_destroy();
with(door) instance_destroy();

test_result();