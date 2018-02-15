test_init(test_closing_door_plugs_leak);

// arrange
var door = instance_create_depth(0,0,0,obj_door);
var room1 = instance_create_depth(0,0,0,obj_room);
var room2 = instance_create_depth(0,0,0,obj_room);
room1.has_proper_leak = true;
room1.oxygen_is_leaking = true;
room2.oxygen_is_leaking = true;

door.room1 = room1;
ds_list_add(room1.doors, door);
door.room2 = room2;
ds_list_add(room2.doors, door);
door.is_open = true;

// act
with(door) scr_gate_toggle();

// assert
assert_false(door.is_open, "door.is_open");
assert_true(room1.oxygen_is_leaking, "room1 oxygen_is_leaking");
assert_false(room2.oxygen_is_leaking, "room2 oxygen_is_leaking");

// cleanup
with(obj_room) instance_destroy();
with(door) instance_destroy();

test_result();