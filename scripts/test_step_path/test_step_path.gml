test_init(test_step_path);

//arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
// act
scr_step_path(astro);
// assert
assert_false(path_exists(astro.path), "path_exists");

//cleanup
instance_destroy(astro);

test_result();