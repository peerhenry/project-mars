/// @arg shooter
/// @arg x
/// @arg y
/// @arg target
var arg_shooter = argument0;
var arg_x = argument1;
var arg_y = argument2;
var arg_target = argument3;

var result = false;
var temp = arg_target.solid;
arg_target.solid = false;
result = scr_line_collides_with_solids(arg_x, arg_y, arg_target.x, arg_target.y);
arg_target.solid = temp;
return result;