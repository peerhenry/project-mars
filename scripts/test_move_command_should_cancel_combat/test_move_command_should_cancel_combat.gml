test_init(test_move_command_should_cancel_combat);

// arrange
var astro = instance_create_depth(32, 32, 0, obj_astronaut_playable);
var enemy = instance_create_depth(512, 512, 0, astro.enemy_object);
astro.target = enemy;
var can_pursue = scr_pursue_target(astro);

// act
astro.is_selected = true;
scr_command(128, 128);

// assert
assert_equal(noone, astro.target, "astronaut action");
assert_equal(astronaut_action.moving_by_command, astro.current_action, "astronaut action");

// cleanup
instance_destroy(astro);
instance_destroy(enemy);

test_result();