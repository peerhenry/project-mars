test_init(test_attack);

// arrange
var astro = instance_create_depth(32,32,0,obj_astronaut_playable);
var enemy = instance_create_depth(128,128,0,astro.enemy_object);

// act
var can_attack = scr_attack(astro, enemy);

// assert
assert_true(can_attack, "can_attack");
assert_equal(enemy, astro.target, "target");

// cleanup
instance_destroy(astro);
instance_destroy(enemy);

test_result();