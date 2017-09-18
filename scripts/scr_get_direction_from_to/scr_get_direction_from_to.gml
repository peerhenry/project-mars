/// @arg origin
/// @arg target
var arg_source = argument0;
var arg_target = argument1;
var dx = arg_target.x - arg_source.x;
var dy = arg_target.y - arg_source.y;
return scr_get_approximate_direction(dx, dy);