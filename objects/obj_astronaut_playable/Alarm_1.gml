/// @description Construction

if(!is_walking && current_action = astronaut_action.idle)
{
	// do an autotask
	
	scr_look_for_construction(id);
}

alarm[1] = 30 + round(random_range(-5,5));