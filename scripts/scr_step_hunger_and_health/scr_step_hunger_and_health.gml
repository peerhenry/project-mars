/// @arg astronaut
function scr_step_hunger_and_health(argument0) {
	var arg_astronaut = argument0;

	with(arg_astronaut)
	{
		if(food_level == 0)
		{
			entity_health -= global.starvation_speed;
		}
		else
		{
			food_level -= global.hunger_speed;
			if(food_level <= 0) food_level = 0;
		}
	}


}
