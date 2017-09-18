test_init(test_can_shoot_unobstructed);

// 1. Without obstruction

// arrange
var shooter = instance_create_depth(0,0,0, obj_astronaut);
var target = instance_create_depth(64,64,0, obj_astronaut);

// act
var result = scr_can_shoot_unobstructed(shooter, target);

// assert
assert_true(result, "unobstructed");

// 2. With obstruction

// arrange
var obstruction = instance_create_depth(32, 32,0, obj_rock);

// act
result = scr_can_shoot_unobstructed(shooter, target);

// assert
assert_false(result, "unobstructed");

// cleanup
instance_destroy(shooter);
instance_destroy(target);
instance_destroy(obstruction);

// result
test_result();