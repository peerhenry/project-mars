/// @arg shooter
/// @arg target
/// @arg dx
/// @arg dy
/// @arg expect
var arg_shooter = argument0;
var arg_target = argument1;
var arg_dx = argument2;
var arg_dy = argument3;
var arg_expect = argument4;

var result = scr_has_line_of_sight_from(arg_shooter, arg_target.x + arg_dx, arg_target.y + arg_dy, arg_target);
assert_equal(
	arg_expect, 
	result, 
	"has_line_of_sight_from dx, dy: (" + string(arg_dx) + ", " + string(arg_dy) + ")"
);