/// @description Construction

if(!is_walking && current_action = astronaut_action.idle)
{
	// do an autotask
	scr_autotask(id);
}

alarm[1] = 30 + round(random_range(-5,5));