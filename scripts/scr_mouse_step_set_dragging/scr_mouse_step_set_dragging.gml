/// @arg mouse_listener
function scr_mouse_step_set_dragging(argument0) {
	var arg_mouse_listener = argument0;

	with(arg_mouse_listener)
	{
		if(mouse_check_button_pressed(mb_left))
		{
			click_x = mouse_x;
			click_y = mouse_y;
		}
	
		// Drag
		var drag_released = false;
		var left_released = false;

		if(mouse_check_button(mb_left))
		{
			if(global.mousedrag_from != mousedrag_from.none && global.mousedrag_from != mousedrag_from.world)
			{
				exit; //not starting or continuing drag from the world
			}
	
			// larger than 5 pixels
			var sig_x = abs(mouse_x - click_x) > 5;
			var sig_y = abs(mouse_y - click_y) > 5;
			if(sig_x || sig_y)
			{
				is_dragging	= true;
			}
			else
			{
				is_dragging	= false;
			}
		}
	}


}
