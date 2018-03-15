if(global.mousedrag_from == mousedrag_from.world) exit; // prevent step when dragging into this from outside

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

mouse_over = window_mouse_x > x && 
	window_mouse_x < x + width && 
	window_mouse_y > y && 
	window_mouse_y < y + height;

var released_for_this = mouse_check_button_released(mb_left) && global.gui_press_button == id;
if(mouse_over)
{
	var pressed = mouse_check_button_pressed(mb_left);

	if(pressed) global.gui_press_button = id;
	else if(released_for_this)
	{
		event_user(0);
	}
}

if(released_for_this) global.gui_press_button = noone;