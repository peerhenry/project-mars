/// @param attacker
/// @param target
var arg_attacker = argument0;
var arg_target = argument1;
with(arg_attacker)
{
	current_action = astronaut_action.move_to_attack;
	target = arg_target;
	scr_navigate(id, arg_target.x, arg_target.y);
}