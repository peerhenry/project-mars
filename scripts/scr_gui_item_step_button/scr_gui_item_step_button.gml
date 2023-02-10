/// @arg gui_button
function scr_gui_item_step_button(argument0) {
	// todo: finish
	with(argument0)
	{
		scr_gui_item_step_set_hover(id);
	
		var mouse_pressed = mouse_check_button_pressed(mb_left);
		var mouse_down = mouse_check_button(mb_left);
		var mouse_released = mouse_check_button_released(mb_left);
	
		if(hover && mouse_pressed) pressed = true;
	
		button_down = hover && pressed && mouse_down;
		button_hover = hover && !mouse_down;
	
		if(hover && pressed && mouse_released)
		{	
			// 1. call click action script
			if(script_exists(click_script)) script_execute(click_script, id);
			// 2. make callback to container
			with(container)
			{
				callback_item = other.id;
				event_user( macro_gui_container_click_callback );
			}
		}
	
		if(mouse_released) pressed = false;
	
		scr_gui_item_step_button_color(id);
	}


}
