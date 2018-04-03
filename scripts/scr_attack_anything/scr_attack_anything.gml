/// @arg attacker
var arg_attacker = argument0;

scr_trace("attack anything: " + string(arg_attacker)); // DEBUG

var last_time = current_time;

var attacking = false;
with(arg_attacker)
{
	// find movable target
	var new_target = noone;
	with(obj_movable)
	{
		// todo: change to dynamic enemy ownership check
		if(owner == macro_player)
		{
			var can_reach = scr_can_navigate_adjacent(arg_attacker, x, y);
			if(can_reach)
			{
				new_target = id;
				show_debug_message("can navigate evaluated to true..."); // DEBUG
				break;
			}
		}
	}
	
	show_debug_message("dt to movable: " + string(current_time-last_time));
	last_time = current_time;
	
	if(new_target != noone)
	{
		attacking = scr_attack(arg_attacker, new_target);
		break;
	}
	
	show_debug_message("dt to attack: " + string(current_time-last_time));
	last_time = current_time;
	
	// try to attack construction
	with(obj_constructable)
	{
		var is_shootable = scr_instance_inherits(id, obj_base_component) || scr_instance_inherits(id, obj_wall);
		if(is_shootable && owner == macro_player) // todo: change to dynamic enemy ownership check
		{
			attacking = scr_attack(arg_attacker, id);
			if(attacking) break; // prevent looping over all constructables
		}
	}
	
	show_debug_message("dt to constructable: " + string(current_time-last_time));
	last_time = current_time;
}

return attacking;