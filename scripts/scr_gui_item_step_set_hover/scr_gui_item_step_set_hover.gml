/// @arg gui_item
with(argument0)
{
	var wmx = window_mouse_get_x();
	var wmy = window_mouse_get_y();
	var new_hover = (wmx >= left && wmx <= right && wmy >= top && wmy <= bottom);
	if(new_hover != hover)
	{
		hover = new_hover;
		if(hover)
		{
			if(script_exists(mouse_enter_script)) script_execute(mouse_enter_script, id);
			with(container){
				callback_item = other.id;
				event_user(macro_gui_container_mouse_enter_callback);
			}
		}
		else
		{
			if(script_exists(mouse_leave_script)) script_execute(mouse_leave_script, id);
			with(container){
				callback_item = other.id;
				event_user(macro_gui_container_mouse_leave_callback);
			}
		}
	}
	if(hover) global.gui_hover_item = id;
}