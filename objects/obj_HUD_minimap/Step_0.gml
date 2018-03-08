var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

var mouse_over = window_mouse_x > x && 
	window_mouse_x < x + size[0] && 
	window_mouse_y > y && 
	window_mouse_y < y + size[1];

var mouse_down = mouse_check_button(mb_left);

if(mouse_over)
{
	hover = true;
	if(mouse_down)
	{
		event_user(0);
	}
}
else
{
	hover = false;
}