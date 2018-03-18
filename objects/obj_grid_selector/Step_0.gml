/// @description reset global.selected_grid
event_inherited();

// todo: remove this grid selection logic, put it somewhere else
/*
if(is_selected)
{
	// mouse click may deselect this
	if(mouse_check_button(mb_left) || mouse_check_button(mb_right))
	{
		if(mouse_x < x + 15 && mouse_x > x - 15 && mouse_y < y + 15 && mouse_y > y -15)
		{
			// ok you're special
		}
		else
		{
			is_selected = false;
			global.selected_grid = noone;
		}
	}
}
*/