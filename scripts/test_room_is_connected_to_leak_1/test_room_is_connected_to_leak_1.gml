// one room, no leak
test_init(test_room_is_connected_to_leak_1);

// arrange
var base_room = instance_create_depth(0,0,0,obj_room);
var aggr = ds_list_create();

// act
var result = scr_room_is_connected_to_leak(base_room, aggr);

// assert
assert_false(result, "oxygen_is_leaking");

// cleanup
ds_list_destroy(aggr);
with(base_room) instance_destroy();

test_result();