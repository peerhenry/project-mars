// arrange
var shooter = instance_create_depth(0,0,0, obj_astronaut);

var target = instance_create_depth(1024,1024,0, obj_astronaut);
var obstruction1 = instance_create_depth(target.x, target.y-32, 0, obj_rock);
var obstruction2 = instance_create_depth(target.x, target.y+32, 0, obj_rock);

// act & assert
assert_has_line_of_sight_from(shooter, target, -64, -64, true);
assert_has_line_of_sight_from(shooter, target, -32, -32, true);
assert_has_line_of_sight_from(shooter, target, -32, -64, false);
assert_has_line_of_sight_from(shooter, target, -64, -32, true);

assert_has_line_of_sight_from(shooter, target, -64, 64, true);
assert_has_line_of_sight_from(shooter, target, -32, 32, true);
assert_has_line_of_sight_from(shooter, target, -64, 32, true);
assert_has_line_of_sight_from(shooter, target, -32, 64, false);

// cleanup
instance_destroy(shooter);
instance_destroy(target);
instance_destroy(obstruction1);
instance_destroy(obstruction2);