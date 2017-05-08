/// @description Insert description here
// You can write your code in this editor

if(health == 0)
{
	is_walking = false;
	path_end();
	// die
	instance_destroy();
	return;
}

if(path_position > 0.001 && path_position < 0.999)
{
	if(!is_walking) is_walking = true;
}
else
{
	if(is_walking)
	{
		prev_x = x;
		prev_y = y;
		is_walking = false;
		path_end();
	}
}

if(is_outside){
	if(oxygen > 0){
		oxygen -= o2_depletion_speed;
	}
	else{
		health -= suffocation_speed;
	}
} else{
	if(inside_room.oxygen_level == 0){
		health -= suffocation_speed;
	}
}