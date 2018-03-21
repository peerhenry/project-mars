var hovering_over_gui = false;

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
		if(mouse_over)
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
	with(obj_HUD_details_panel)
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