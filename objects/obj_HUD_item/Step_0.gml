if(global.mousedrag_from == mousedrag_from.world) exit; // prevent step when dragging into this from outside

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

mouse_over = window_mouse_x > x && 
	window_mouse_x < x + 32 && 
	window_mouse_y > y && 
	window_mouse_y < y + 32;

var clicked = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);

if(mouse_over)
{
	if(state != button_state.selected)
	{
		var new_state = button_state.hover;
		with(obj_HUD_item)
		{
			state = button_state.none;
		}
		if(clicked)
		{
			new_state = button_state.selected;
			event_user(0);
		}
		state = new_state;
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