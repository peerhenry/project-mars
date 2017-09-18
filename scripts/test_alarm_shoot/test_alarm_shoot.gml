test_init(test_alarm_shoot);

// arrange
var astro = instance_create_depth(32,32,0,obj_astronaut_playable);
var enemy = instance_create_depth(100,100,0,astro.enemy_object);

// act
with(astro){
	event_perform(ev_alarm, 0);
}

// assert
assert_equal(enemy, astro.auto_target, "auto target");
assert_equal(noone, astro.target, "target");

// cleanup
instance_destroy(astro);
instance_destroy(enemy);

test_result();
