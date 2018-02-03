/// @arg shooter
/// @arg target
var arg_shooter = argument0;
var arg_target = argument1;

with(arg_shooter)
{
	var temp = arg_target.solid;
	arg_target.solid = false;
	return mp_linear_path(shoot_path, arg_target.x, arg_target.y, global.projectile_speed, false);
	arg_target.solid = temp;
}