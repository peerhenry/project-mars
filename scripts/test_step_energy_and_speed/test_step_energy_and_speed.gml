test_init(test_step_energy_and_speed);

var astro = instance_create_depth(0,0,0,obj_astronaut);
var energy_before = astro.energy;
var expected_energy = energy_before - global.energy_depletion;
var expected_speed = scr_calculate_movement_speed(expected_energy);

// act
scr_step_energy_and_speed(astro);

// assert
var energy_after = astro.energy;

assert_equal(expected_energy, energy_after, "energy");
assert_approximate(expected_speed, astro.movement_speed, 0.001, "movement speed");

// cleanup
instance_destroy(astro);

test_result();