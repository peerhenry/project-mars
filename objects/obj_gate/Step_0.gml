if(image_index == target_frame)
{
	image_speed = 0;
}

if(is_open){
	if(auto_close)
	{
		var astronaut = collision_rectangle(x-15, y-15, x+15, y+15, obj_astronaut, false, true);
		if(astronaut == noone) scr_gate_toggle();	
	}
} else {
	if(!locked)
	{
		var astronaut = collision_rectangle(x-15, y-15, x+15, y+15, obj_astronaut, false, true);
		if(astronaut != noone) scr_gate_toggle();
	}
}