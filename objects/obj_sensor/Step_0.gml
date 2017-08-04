event_inherited();
if(is_selected)
{
	// mouse click may deselect this
	if(mouse_check_button(mb_left) || mouse_check_button(mb_right))
	{
		if(mouse_x < x + 15 && mouse_x > x - 15 && mouse_y < y + 15 && mouse_y > y -15)
		{
			// ok you're special
		}
		else
		{
			is_selected = false;
			global.sensor_selected = false;
		}
	}
}