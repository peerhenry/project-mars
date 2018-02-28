/// @param arg_enemy
var arg_enemy = argument0;

var at_least_one_attacks = false;

with(obj_task_actor)
{
	if(is_selected)
	{
		var can_attack = scr_attack(id, arg_enemy);
		if(can_attack) at_least_one_attacks = true;
	}
}

if(at_least_one_attacks)
{
	with(obj_movable)
	{
		if(is_selected && !object_is_ancestor(object_index, obj_task_actor)) scr_command_move_to(id, arg_enemy.x, arg_enemy.y);
	}
}

return at_least_one_attacks;