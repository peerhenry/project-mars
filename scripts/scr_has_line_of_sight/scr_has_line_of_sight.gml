/// @arg shooter
/// @arg target
var arg_shooter = argument0;
var arg_target = argument1;

return scr_has_line_of_sight_from(arg_shooter, arg_shooter.x, arg_shooter.y, arg_target);