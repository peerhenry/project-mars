/// @arg astronaut
var arg_astronaut = argument0;

if( !scr_instance_inherits(arg_astronaut, obj_task_actor) )
{
	show_message("scr_update_action called with wrong argument: not an obj_task_actor");
	exit;
}

with(arg_astronaut)
{
	switch(current_action)
	{
		case astronaut_action.idle:
			if(is_rampaging)
			{
				var attacking = scr_attack_anything(id);
				if(!attacking) is_rampaging = false;
				exit;
			}
			var tile = instance_position(x, y, obj_base_tile);
			if(tile != noone && tile.is_broken)
			{
				repair_target = tile;
				current_action = astronaut_action.repairing;
			}
			break;
		case astronaut_action.constructing:
			var construction_speed = 10; // 100;
			var completion = construction[? construction_completion] + construction_speed/(30*construction[? construction_time]);
			ds_map_replace(construction, construction_completion, completion);
			if(construction[? construction_completion] >= 100)
			{
				scr_build_complete(construction);
				scr_set_pistol_sprite(id, move_dir, false); // holster pistol
			}
			break;
		case astronaut_action.in_combat:
			if(target == noone && auto_target == noone)
			{
				current_action = astronaut_action.idle;
				if(is_rampaging)
				{
					var attacking = scr_attack_anything(id);
					if(!attacking) is_rampaging = false;
				}
			}
			break;
		case astronaut_action.repairing:
			repair_target.damage -= repair_speed;
			if(repair_target.damage <= 0)
			{
				repair_target.damage = 0;
				repair_target = noone;
				current_action = astronaut_action.idle;
			}
			break;
	}
}