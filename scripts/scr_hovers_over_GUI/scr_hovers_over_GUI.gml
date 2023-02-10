function scr_hovers_over_GUI() {
	var hovering_over_gui = false;

	with(obj_gui)
	{
		for(var n = 0; n < ds_list_size(gui_item_list); n++)
		{
			var next = gui_item_list[|n];
			if(next.hover) return true;
		}
	}

	// the rest is to become obsolete...

	with(obj_gui_panel_empty)
	{
		if(hover)
		{
			hovering_over_gui = true;
			break;
		}
	}

	if(!hovering_over_gui)
	{
		with(obj_HUD_item)
		{
			if(hover)
			{
				hovering_over_gui = true;
				break;
			}
		}
	}

	if(!hovering_over_gui)
	{
		with(obj_HUD)
		{
			if(mouse_over_HUD) hovering_over_gui = true;
		}
	}

	if(!hovering_over_gui)
	{
		with(obj_HUD_entity_panel)
		{
			if(hover) hovering_over_gui = true;
		}
	}

	if(!hovering_over_gui)
	{
		with(obj_HUD_outliner)
		{
			if(hover) hovering_over_gui = true;
		}
	}

	with(obj_HUD_minimap)
	{
		if(hover) hovering_over_gui = true;	
	}

	return hovering_over_gui;


}
