/// @param arg_enemy
var arg_enemy = argument0;

with(obj_astronaut_playable)
{
	if(is_selected)
	{
		current_action = astronaut_action.move_to_attack;
		target = arg_enemy;
		scr_navigate(id, arg_enemy.x, arg_enemy.y);
	}
}