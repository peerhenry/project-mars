/// @arg astronaut
debug_instance_inherits(argument0, obj_astronaut);
var arg_astronaut = argument0;

with(arg_astronaut)
{
	switch(current_action)
	{
		case astronaut_action.constructing:
			scr_trace("CONSTRUCTING!");
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