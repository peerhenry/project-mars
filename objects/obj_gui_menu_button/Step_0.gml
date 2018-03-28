if(global.mousedrag_from == mousedrag_from.world) exit; // prevent step when dragging into this from outside

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

var new_hover = window_mouse_x > x && 
	window_mouse_x < x + width && 
	window_mouse_y > y && 
	window_mouse_y < y + height;

var released_for_this = mouse_check_button_released(mb_left) && global.gui_press_button == id;
if(new_hover)
{
	if(!hover) // mouse enter
	{
		resolve_execute(script_container, "play_sound", sound_hover);
	}
	var pressed = mouse_check_button_pressed(mb_left);
	if(pressed) global.gui_press_button = id;
	else if(released_for_this)
	{
		event_user(macro_event_gui_button_click);
	}
}

hover = new_hover;
if(released_for_this) global.gui_press_button = noone;