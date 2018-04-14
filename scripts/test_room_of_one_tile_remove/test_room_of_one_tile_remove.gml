test_init(test_room_of_one_tile_remove);

// arrange
var ii = 2;
var jj = 2;
scr_setup_room(ii,jj,1,1);

// act
var tx = scr_gi_to_rc(ii);
var ty = scr_gi_to_rc(jj);
var bt = instance_position(tx, ty, obj_base_tile);
instance_destroy(bt);

// assert
assert_object_count(0, obj_room);

// cleanup
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();

test_result();