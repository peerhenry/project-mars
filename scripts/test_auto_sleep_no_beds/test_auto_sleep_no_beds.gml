test_init(test_auto_sleep_no_beds);

// arrange
var astro = instance_create_depth(32,32,0,obj_astronaut);
astro.wears_suit = false;
astro.energy = astro.auto_sleep_level + 1;
// act
var result = scr_auto_sleep(astro);
// assert
assert_false(result, "auto sleep result");
// cleanup
instance_destroy(astro);

test_result();