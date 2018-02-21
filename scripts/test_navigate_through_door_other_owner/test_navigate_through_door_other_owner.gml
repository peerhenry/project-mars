test_init(test_navigate_through_door_other_owner);

// arrange
//scr_setup_hall(2,2,2,10);
scr_setup_room(2, 2, 1, 10);
scr_setup_door(2,5,0);
var enemy = scr_create_enemy_astronaut(scr_gi_to_rc(2), scr_gi_to_rc(2));

// act
scr_navigate(enemy, scr_gi_to_rc(2), scr_gi_to_rc(10));

// assert
assert_false(enemy.is_moving, "is walking");

// cleanup
with(obj_constructable) instance_destroy();
with(obj_room) instance_destroy();
instance_destroy(enemy);

test_result();