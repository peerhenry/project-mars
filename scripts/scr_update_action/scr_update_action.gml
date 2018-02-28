/// @arg astronaut
var arg_astronaut = argument0;

if( !scr_instance_inherits(arg_astronaut, obj_astronaut) ) exit;

with(arg_astronaut)
{
	switch(current_action)
	{
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
	}
}