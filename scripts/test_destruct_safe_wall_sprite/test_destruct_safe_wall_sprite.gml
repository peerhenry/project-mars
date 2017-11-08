test_init(test_destruct_safe_wall_sprite);

// arrange
global.resource_amount_metal = 100000;
scr_update_ghost(64, 64, 128, 128, macro_basetile, 0, true); // 3x3
scr_build_new();

// assert setup
with(obj_base_tile) assert_true(under_construction, "under_construction");
assert_object_count(9, obj_base_tile);
assert_object_count(16, obj_wall);
assert_object_count(0, obj_grid);
assert_object_count(0, obj_room);
var wall = instance_position(96, 160, obj_wall);
assert_true(wall != noone, "wall != noone");

// act
scr_update_ghost(96, 160, 96, 160, macro_destruct_safe, 0, false); // destruct @ middle bottom wall
scr_build_new();

// assert
assert_object_count(6, obj_base_tile);
assert_object_count(14, obj_wall);
assert_object_count(0, obj_destruct_placemarker);

// test wall corners
var topleft = instance_position(32, 32, obj_wall);
assert_equal(9, topleft.image_index, "topleft.image_index");
var topright = instance_position(160, 32, obj_wall);
assert_equal(12, topright.image_index, "topright.image_index");
var bottomleft = instance_position(32, 128, obj_wall);
assert_equal(3, bottomleft.image_index, "bottomleft.image_index");
var bottomright = instance_position(160, 128, obj_wall);
assert_equal(6, bottomright.image_index, "bottomright.image_index");

//fail("because yo!");

// cleanup
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();
with(obj_destruct_placemarker) instance_destroy();
scr_clear_all_construction_queues();

test_result();