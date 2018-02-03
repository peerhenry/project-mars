/// @arg shooter
/// @arg x
/// @arg y
/// @arg target
var arg_shooter = argument0;
var arg_x = argument1;
var arg_y = argument2;
var arg_target = argument3;

var can_shoot = false;

var r_x = arg_shooter.x;	// remember where you were
var r_y = arg_shooter.y;
with(arg_shooter)
{
	x = arg_x;
	y = arg_y;
	var temp = arg_target.solid;
	arg_target.solid = false;
	can_shoot = mp_linear_path(shoot_path, arg_target.x, arg_target.y, global.projectile_speed, false);
	arg_target.solid = temp;
	x = r_x;
	y = r_y;
}

return can_shoot;