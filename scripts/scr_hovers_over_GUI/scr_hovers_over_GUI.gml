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

return hovering_over_gui;