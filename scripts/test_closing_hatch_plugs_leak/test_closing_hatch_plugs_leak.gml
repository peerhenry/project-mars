test_init(test_closing_hatch_plugs_leak);

// arrange
var hatch = instance_create_depth(0,0,0,obj_hatch);
var base_room = instance_create_depth(0,0,0,obj_room);
hatch.base_room = base_room;
hatch.is_open = true;
base_room.oxygen_is_leaking = true;

// act
with(hatch) scr_gate_toggle();

// assert
assert_false(hatch.is_open, "hatch.is_open");
assert_false(base_room.oxygen_is_leaking, "oxygen_is_leaking");

// cleanup
with(hatch) instance_destroy();
with(base_room) instance_destroy();

test_result();