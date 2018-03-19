/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	var dE = global.sleep_level_depletion;
	if(floor(sleep_level) - floor(sleep_level - dE) != 0)
	{
		movement_speed = scr_calculate_movement_speed(sleep_level);
	}
	if(sleep_level > 0) sleep_level -= dE;
	if(sleep_level <= 0) sleep_level = 0;
}