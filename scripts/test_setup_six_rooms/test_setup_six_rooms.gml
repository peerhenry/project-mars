test_init(test_setup_six_rooms);
// act
scr_setup_six_rooms(1,1,5,5,3);
// assert
assert_object_count(14, obj_room);
// cleanup
with(obj_door) instance_destroy();
with(obj_hatch) instance_destroy();
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();
with(obj_room) instance_destroy();

test_result();