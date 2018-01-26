if(mouse_x > left_limit && mouse_x < right_limit)
{
	with(slider)
	{
		x = mouse_x;
		percentage = macro_calculate_percentage;
	}
	event_user(macro_on_change);
}