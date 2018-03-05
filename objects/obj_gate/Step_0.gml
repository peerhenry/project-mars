event_inherited();
if(image_index == target_frame)
{
	image_speed = 0;
}

if(is_open)
{
	if(auto_close)
	{
		var entity = collision_rectangle(x-15, y-15, x+15, y+15, obj_movable, false, true);
		if(entity == noone) scr_gate_toggle(id);	
	}
} else
{
	if(!locked)
	{
		var entity = collision_rectangle(x-15, y-15, x+15, y+15, obj_movable, false, true);
		if(entity != noone) scr_gate_toggle(id);
	}
}