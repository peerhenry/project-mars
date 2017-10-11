var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

var mouse_over = window_mouse_x > x && 
	window_mouse_x < x + 32 && 
	window_mouse_y > y && 
	window_mouse_y < y + 32;

var clicked = mouse_check_button_pressed(mb_left);

if(mouse_over)
{
	global.hovering_over_HUD = true;
	if(clicked)
	{
		event_user(0);
	}
	if(state != button_state.hover)
	{
		state = button_state.hover;
	}
}
else
{
	if(state == button_state.hover)
	{
		// set state to none
		state = button_state.none;
	}
}