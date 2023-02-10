/// @arg shooter
/// @arg target
function scr_target_is_within_range(argument0, argument1) {
	var arg_shooter = argument0;
	var arg_target = argument1;
	var range = scr_get_shooting_range(arg_shooter);
	var ds = scr_d_squared(arg_shooter, arg_target);
	return ds < range*range*1024;


}
