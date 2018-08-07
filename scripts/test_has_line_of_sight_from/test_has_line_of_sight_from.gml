// 1. Without obstruction

// arrange
var shooter = instance_create_depth(1024,1024,0, obj_astronaut);
var target = instance_create_depth(64,64,0, obj_astronaut);

// act
var result = scr_has_line_of_sight_from(shooter, 0, 0, target);

// assert
assert_true(result, "has line of sight");

// 2. With obstruction

// arrange
var obstruction = instance_create_depth(32, 32,0, obj_rock);

// act
result = scr_has_line_of_sight_from(shooter, 0, 0, target);

// assert
assert_false(result, "has line of sight");

// cleanup
instance_destroy(shooter);
instance_destroy(target);
instance_destroy(obstruction);