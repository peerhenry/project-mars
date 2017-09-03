/// @arg astronaut
debug_instance_inherits(argument0, obj_astronaut);
var arg_astronaut = argument0;

with(arg_astronaut)
{
	if(current_action = astronaut_action.constructing)
	{
		var completion = construction[? construction_completion] + 100/(30*construction[? construction_time]);
		ds_map_replace(construction, construction_completion, completion);
		if(construction[? construction_completion] >= 100)
		{
			scr_build_complete(construction);
		}
	}
}