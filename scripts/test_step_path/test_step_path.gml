test_init(test_step_path);

// 1. Along path

//arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
astro.path_position = 0.5;
// act
scr_step_path(global.script_container, astro);
// assert
assert_true(astro.is_walking, "is_walking");

// 2. At path end

//arrange
astro.path_position = 1;
// act
scr_step_path(global.script_container, astro);
// assert
assert_false(astro.is_walking, "is_walking");

//cleanup
instance_destroy(astro);

test_result();