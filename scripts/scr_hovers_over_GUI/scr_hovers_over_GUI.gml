var hovering_over_gui = false;

with(obj_HUD_panel)
{
	if(hovers)
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
	with(obj_astronaut_playable)
	{
		if(hovering_over_details_panel) hovering_over_gui = true;
	}
}

with(obj_HUD_entity_panel)
{
	if(hover) hovering_over_gui = true;
}

return hovering_over_gui;