show_debug_message("pressed slidebar..."); // DEBUG
if(mouse_x > left_limit && mouse_x < right_limit)
{
	show_debug_message("within limits..."); // DEBUG
	with(slider)
	{
		x = mouse_x;
		percentage = macro_calculate_percentage;
		show_debug_message("Calling event " + string(macro_on_change)); // DEBUG
	}
	event_user(macro_on_change);
}