test_init(test_update_in_combat);

// 1. in_combat & no target & no auto_target => action idle

//arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
astro.current_action = astronaut_action.in_combat;
astro.target = noone;
astro.auto_target = noone;
// act
scr_update_action(astro);
// assert
assert_equal(astronaut_action.idle, astro.current_action, "current_action");

// 2. in_combat & target & no auto_target => action in combat

//arrange
astro.current_action = astronaut_action.in_combat;
astro.target = 1; // just so it's not noone
astro.auto_target = noone;
// act
scr_update_action(astro);
// assert
assert_equal(astronaut_action.in_combat, astro.current_action, "current_action");

// 3. in_combat & no target & auto_target => action in combat

//arrange
astro.current_action = astronaut_action.in_combat;
astro.target = noone;
astro.auto_target = 1; // just so it's not noone
// act
scr_update_action(astro);
// assert
assert_equal(astronaut_action.in_combat, astro.current_action, "current_action");

//cleanup
instance_destroy(astro);

test_result();