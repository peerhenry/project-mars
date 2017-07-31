if(!has_initialized)
{
	return false;
}

switch(step)
{
	case 0:
		if(astronaut.is_selected)
		{
			arrow.x = closet.x;
			arrow.y = closet.y - 32;
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
			scr_alert_player("Congratulations! You finished the tutorial.");
		}
}