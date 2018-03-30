/// @arg astronaut
var arg_astronaut = argument0;

if( !scr_instance_inherits(arg_astronaut, obj_astronaut) ) exit;

with(arg_astronaut)
{
	switch(current_action)
	{
		case astronaut_action.idle:
			var tile = instance_position(x, y, obj_base_tile);
			if(tile != noone && tile.is_broken)
			{
				repair_target = tile;
				current_action = astronaut_action.repairing;
			}
			break;
		case astronaut_action.constructing:
			var completion = construction[? construction_completion] + 100/(30*construction[? construction_time]);
			ds_map_replace(construction, construction_completion, completion);
			if(construction[? construction_completion] >= 100)
			{
				scr_build_complete(construction);
			}
			break;
		case astronaut_action.in_combat:
			if(target == noone && auto_target == noone) current_action = astronaut_action.idle;
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