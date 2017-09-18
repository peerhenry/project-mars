/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	var dE = global.energy_depletion;
	if(floor(energy) - floor(energy - dE) != 0)
	{
		movement_speed = 0.5*(1 + sqrt(energy/100))*macro_astronaut_move_speed;
	}
	if(energy > 0) energy -= dE;
	else if(energy < 0) energy = 0;
}