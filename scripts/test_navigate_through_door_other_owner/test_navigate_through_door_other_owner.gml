test_init(test_navigate_through_door_other_owner);

assert_true(scr_navgrid_cell_is_free(1,1), "11 is free");
assert_true(scr_navgrid_cell_is_free(2,2), "22 is free");

// arrange
scr_setup_room(2, 2, 1, 10);
scr_setup_door(2,5,0);
var enemy = scr_create_enemy_astronaut(scr_gi_to_rc(2), scr_gi_to_rc(2));

// assert setup
with(obj_door) assert_false(enemy.owner == owner, "door and enemy owners are different");
assert_equal(1, instance_number(obj_door), "door count");
assert_equal(10, instance_number(obj_base_tile), "room count");
assert_equal(26, instance_number(obj_wall), "room count");

// act
var d_i = 2;
var d_j = 10;
scr_navigate(enemy, scr_gi_to_rc(d_i), scr_gi_to_rc(d_j));

// assert
with(enemy)
{
	assert_false(d_i == dest_i && d_j == dest_j, "destination is through door");
	var d_x = scr_gi_to_rc(d_i);
	var d_y = scr_gi_to_rc(d_j);
	assert_true(path_exists(path), "path_exists(path)");
	assert_false(d_x == path_get_x(path, 1) && d_y == path_get_y(path, 1), "path destination is through door");
}

// cleanup
with(obj_constructable) instance_destroy();
with(obj_room) instance_destroy();
instance_destroy(enemy);

test_result();