/// @arg attacker
/// @arg target
/// @arg x
/// @arg y
function scr_can_shoot_from(argument0, argument1, argument2, argument3) {
	var arg_attacker = argument0;
	var arg_target = argument1;
	var arg_x = argument2;
	var arg_y = argument3;

	var is_a_shooting_spot = false;
	var range = scr_get_shooting_range(arg_attacker);
	var in_range = scr_points_are_within_range(arg_x, arg_y, arg_target.x, arg_target.y, range);
	if(in_range) is_a_shooting_spot = scr_has_line_of_sight_from(arg_attacker, arg_x, arg_y, arg_target);
	return is_a_shooting_spot;


}
