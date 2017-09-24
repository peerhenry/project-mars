test_init(test_step_gate);

// 1. not walking

// arrange
var clamp_coord = scr_gi_to_rc(5);
var astro = instance_create_depth(clamp_coord,clamp_coord,0,obj_astronaut);
// act
scr_step_gate(astro);
// assert
assert_false(astro.is_moving_through_gate, "is_moving_through_gate");

// 2. walking

// arrange
astro.is_walking = true;
// act
scr_step_gate(astro);
// assert
assert_false(astro.is_moving_through_gate, "is_moving_through_gate");

// 3. walking through hatch

// arrange
var gate = instance_create_depth(clamp_coord, clamp_coord, 0, obj_hatch);
// act
scr_step_gate(astro);
// assert
assert_true(astro.is_moving_through_gate, "is_moving_through_gate");

// 4. Just left the gate, without a room the astro should be outside

// arrange
astro.is_outside = false;
instance_destroy(gate);
// act
scr_step_gate(astro);
// assert
assert_false(astro.is_moving_through_gate, "is_moving_through_gate");
assert_true(astro.is_outside, "is_outside");

//cleanup
instance_destroy(astro);
test_result();