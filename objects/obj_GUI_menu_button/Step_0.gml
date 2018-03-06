var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

mouse_over = window_mouse_x > x && 
	window_mouse_x < x + width && 
	window_mouse_y > y && 
	window_mouse_y < y + height;

var clicked = mouse_check_button_released(mb_left);

if(mouse_over && clicked)
{
	event_user(0);
}