/// @arg shooter
/// @arg target
function scr_can_shoot(argument0, argument1) {
	var arg_shooter = argument0;
	var arg_target = argument1;

	return scr_can_shoot_from(arg_shooter, arg_target, arg_shooter.x, arg_shooter.y);


}
