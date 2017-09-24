/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	var dE = global.energy_depletion;
	if(floor(energy) - floor(energy - dE) != 0)
	{
		movement_speed = scr_calculate_movement_speed(energy);
	}
	if(energy > 0) energy -= dE;
	else if(energy < 0) energy = 0;
}