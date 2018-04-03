test_init(test_alarm_shoot_target);

// arrange
var astro = instance_create_depth(32, 32, 0, obj_astronaut);
var enemy = scr_create_astronaut_safe(100, 100, macro_enemy);
astro.target = enemy;

// act
with(astro){
	event_perform(ev_alarm, 0);
}

// assert
assert_equal(noone, astro.auto_target, "auto target");
assert_equal(enemy, astro.target, "target");
assert_equal(astronaut_action.in_combat, astro.current_action, "current_action");

// cleanup
instance_destroy(astro);
instance_destroy(enemy);
with(obj_projectile) instance_destroy();

test_result();
