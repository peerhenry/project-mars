test_init(test_setup_six_rooms);
// act
scr_setup_six_rooms(1,1,5,5,3);
// assert
assert_object_count(14, obj_room);
// cleanup
with(obj_constructable) instance_destroy();
with(obj_room) instance_destroy();
with(obj_resource) instance_destroy();
// assert_cleanup
assert_true(scr_navgrid_cell_is_free(1,1), "navgrid is free at 1,1");
assert_true(scr_navgrid_cell_is_free(2,2), "navgrid is free at 2,2");

test_result();