/// @description Toggle
is_active = !is_active;

if(is_active)
{
	var left = (view_get_wport(0) - width)/2;
	var top = (view_get_hport(0) - height)/2;
	var right = left + width;
	var bottom = top + height;
	panel = scr_create_panel(left, top, right, bottom);
	
	var counter = 0;
	repeat(button_count)
	{
		var object_to_create = button_objects[counter];
		button = instance_create_layer(left + 8, top + 8 + (b_height+8)*counter, macro_logic_layer, obj_gui_menu_button);
		button.text = object_to_create[0];
		button.callback = object_to_create[1];
		if(array_length_1d(object_to_create) > 2) button.callback_arg = object_to_create[2];
		button.width = width - 16;
		button.depth = panel.depth - 1;
		ds_list_add(button_list, button);
		counter++;
	}
}
else
{
	event_user(1);
}
