/// @description Toggle
is_active = !is_active;

if(is_active)
{
	var left = (view_get_wport(0) - width)/2;
	var top = (view_get_hport(0) - height)/2;
	var right = left + width;
	var bottom = top + height;
	panel = scr_create_panel(left, top, right, bottom);
	// options, save, load, quit, return to game
	
	var counter = 0;
	repeat(button_count)
	{
		var text = texts[counter];
		var object_to_create = obj_HUD_menu_button;
		switch(text)
		{
			case "Quit":
				object_to_create = obj_HUD_menu_button_quit;
				break;
			case "Return":
				object_to_create = obj_HUD_menu_button_return;
				break;
		}
		button = instance_create_layer(left + 8, top + 8 + (b_height+8)*counter, macro_logic_layer, object_to_create);
		button.text = text;
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