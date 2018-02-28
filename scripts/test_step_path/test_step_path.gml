test_init(test_step_path);

// 1. Along path

//arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
astro.path_position = 0.5;
// act
scr_step_path(astro);
// assert
assert_true(path_exists(astro.path), "path_exists");
assert_true(astro.is_moving, "is_moving");

// 2. At path end

//arrange
astro.path_position = 1;
// act
scr_step_path(astro);
// assert
assert_false(astro.is_moving, "is_moving");
// assert_false(path_exists(astro.path), "path_exists");

//cleanup
instance_destroy(astro);

test_result();