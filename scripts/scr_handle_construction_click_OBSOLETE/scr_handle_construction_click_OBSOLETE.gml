function scr_handle_construction_click_OBSOLETE(argument0) {
	var arg_construction = argument0;

	if(mouse_check_button_pressed(mb_left))
	{
		click_x = mouse_x;
		click_y = mouse_y;
	}
	
	// Drag
	if(mouse_check_button(mb_left))
	{
		// larger than 5 pixels
		var sig_x = abs(mouse_x - click_x) > 2;
		var sig_y = abs(mouse_y - click_y) > 2;
		if(sig_x || sig_y)
		{
			is_dragging	= true;
		}
		else
		{
			is_dragging	= false;
		}
	}
	else
	{
		is_dragging	= false;
	}
	
	// Place new construction on left release
	if(mouse_check_button_released(mb_left))
	{
		scr_build_new();
		is_dragging	= false;
	}
	
	var rot = global.construction_ghost[? macro_ghost_rotation];
	scr_update_ghost(click_x, click_y, mouse_x, mouse_y, constr_type, rot, is_dragging);
	
	// exit BUILD MODE on RIGHT CLICK
	if(mouse_check_button_pressed(mb_right))
	{
		scr_ghost_reset();
	}


}
