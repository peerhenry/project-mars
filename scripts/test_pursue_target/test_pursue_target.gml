test_init(test_pursue_target);

// arrange
var astro = instance_create_depth(32, 32, 0, obj_astronaut);
var enemy = scr_create_astronaut_safe(512, 512, macro_enemy);
astro.target = enemy;

// act
var can_pursue = scr_pursue_target(astro);

// assert
assert_true(can_pursue, "can_pursue");
assert_equal(astronaut_action.moving_to_shoot, astro.current_action, "astronaut action");
with(astro)
{
	assert_true(dest_i > occ_i, "dest_i > occ_i");
	assert_true(dest_j > occ_j, "dest_j > occ_j");
}

// cleanup
instance_destroy(astro);
instance_destroy(enemy);

test_result();