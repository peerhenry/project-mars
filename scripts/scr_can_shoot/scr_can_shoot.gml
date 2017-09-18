/// @arg shooter
/// @arg target
var arg_shooter = argument0;
var arg_target = argument1;

return scr_target_is_within_range(arg_shooter, arg_target) && scr_can_shoot_unobstructed(arg_shooter, arg_target);