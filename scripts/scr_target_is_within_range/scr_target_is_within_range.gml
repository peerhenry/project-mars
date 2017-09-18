/// @arg shooter
/// @arg target
var arg_shooter = argument0;
var arg_target = argument1;
var range = scr_get_shooting_range(arg_shooter);
var ds = scr_d_squared(arg_shooter, arg_target);
return ds < range*range*1024;