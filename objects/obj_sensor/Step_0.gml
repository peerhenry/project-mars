if(is_selected)
{
	if(mouse_check_button(mb_left) || mouse_check_button(mb_right))
	{
		if(mouse_x < x + 15 && mouse_x > x - 15 && mouse_y < y + 15 && mouse_y > y -15)
		{
			// ok you're special
		}
		else
		{
			is_selected = false;
		}
	}
}
else if(global.sensor_selected)
{
	var any_selected = false;
	with(obj_sensor)
	{
		if(is_selected) any_selected = true;
	}
	if(!any_selected) global.sensor_selected = false;
}