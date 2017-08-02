if(!has_initialized)
{
	return false;
}

switch(step)
{
	case 0:
		if(astronaut.is_selected)
		{
			arrow.target = closet;
			step++;
			scr_alert_player("Right click on the closet to put on the space suit.");
		}
		break;
	case 1:
		if(astronaut.wears_suit)
		{
			instance_deactivate_object(arrow);
			step++;
			scr_alert_player("Now Phillips can safely go outside.");
		}
		break;
	case 2:
		if(astronaut.is_outside)
		{
			step++;
			//scr_alert_player("Congratulations! You finished the tutorial.");
			instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, macro_logic_layer, obj_mission_accomplished);
		}
}