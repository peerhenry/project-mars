/// @param arg_enemy
var arg_enemy = argument0;

var at_least_one_attacks = false;
var can_attack_count = 0; // DEBUG

with(obj_task_actor)
{
	if(is_selected)
	{
		var can_attack = scr_attack(id, arg_enemy);
		if(can_attack)
		{
			can_attack_count++;
			at_least_one_attacks = true;
		}
	}
}

// selected non-task acctors simply move to target
if(at_least_one_attacks)
{
	with(obj_movable)
	{
		if(is_selected && !object_is_ancestor(object_index, obj_task_actor)) scr_command_move_to(id, arg_enemy.x, arg_enemy.y);
	}
}

with(obj_HUD_DEBUG) message_lines = ["can_attack_count: " + string(can_attack_count)]

return at_least_one_attacks;