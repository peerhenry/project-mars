/// @arg shooter
/// @arg target
var arg_x1 = argument0;
var arg_y1 = argument1;
var arg_x2 = argument2;
var arg_y2 = argument3;
var arg_range = argument4;

var dx = arg_x1 - arg_x2;
var dy = arg_y1 - arg_y2;
var ds = dx*dx + dy*dy;
return ds < arg_range*arg_range*1024;