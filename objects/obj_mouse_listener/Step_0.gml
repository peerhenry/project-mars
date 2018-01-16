if(global.hovering_over_HUD)
{
	is_dragging	= false;
	exit; // HUD clicks must not propagate here.
}

#region CONSTRUCTION INPUT

var constr_type = scr_get_selected_constr_type();
if(constr_type != noone) // BUILD MODE
{
	// Left pressed: set click origin and hide astronaut panels
	if(mouse_check_button_pressed(mb_left))
	{
		click_x = mouse_x;
		click_y = mouse_y;
		scr_hide_all_panels();
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
	
	scr_update_ghost(click_x, click_y, mouse_x, mouse_y, constr_type, global.build_rotation, is_dragging);
	
	// exit BUILD MODE on RIGHT CLICK
	if(mouse_check_button_pressed(mb_right))
	{
		scr_ghost_reset();
		scr_hide_categories();
	}
	
	return;
}
#endregion

#region ASTRONAUT SELECT/ORDERS INPUT

var orders_given = false;
var just_selected = false;

if(!is_dragging)
{
	// LEFT CLICK: set click origin for dragging
	if(mouse_check_button_pressed(mb_left))
	{
		scr_hide_categories();
		click_x = mouse_x;
		click_y = mouse_y;
	}
	
	// LEFT DOWN: while down, check if it's dragging
	if(mouse_check_button(mb_left))
	{
		var sig_x = abs(mouse_x - click_x) > 5;
		var sig_y = abs(mouse_y - click_y) > 5;
		if(sig_x && sig_y)
		{
			is_dragging	= true;
		}
		else
		{
			is_dragging	= false;
		}
	}
	
	if(mouse_check_button_released(mb_right))
	{
		// deselect everything
		scr_hide_categories();
		var select_astro = instance_position(mouse_x, mouse_y, obj_astronaut_playable);
		scr_hide_all_panels();
		with(obj_astronaut_playable)
		{
			if(id != select_astro){
				is_selected = false;
			}
			else{
				show_details = true;
			}
		}
	}
	
	// Left release & not dragging
	// Either select 1 astronaut or command selected astronauts
	if(mouse_check_button_released(mb_left))
	{
		var single_select_astro = instance_position(mouse_x, mouse_y, obj_astronaut_playable);
		
		if(single_select_astro != noone)
		{
			// deselect other astronauts
			with(obj_astronaut_playable)
			{
				is_selected = false;
			}
			
			scr_hide_all_panels();
			single_select_astro.is_selected = true;
			just_selected = true;
		}
		else
		{
			scr_command(mouse_x, mouse_y);
		}
	}
}
else if(mouse_check_button_released(mb_left)) // - DRAG SELECT
{
	var rec_left = min(click_x, mouse_x);
	var rec_right = max(click_x, mouse_x);
	var rec_top = min(click_y, mouse_y);
	var rec_bottom = max(click_y, mouse_y);
	
	// selection rectangle must contain a tile center
	if(rec_right - rec_left > 15 || rec_bottom - rec_top > 15)
	{
		with(obj_astronaut_playable)
		{
			if(
				x >= rec_left && x <= rec_right &&
				y >= rec_top && y <= rec_bottom)
			{
				is_selected = true;
				just_selected = true;
			}
			else{
				is_selected = false;
			}
		}
	}
	else // selection rectangle is so small, it only selects if it is contained in astronaut BB
	{
		with(obj_astronaut_playable)
		{
			if(
				rec_left > x - 15  && rec_right < x + 15 &&
				rec_top > y - 15 && rec_bottom < y + 15)
			{
				is_selected = true;
				just_selected = true;
			}
			else{
				is_selected = false;
			}
		}
	}
	
	is_dragging = false;
}

#endregion

// play selection sounds
if(just_selected)
{
	any_astronauts_selected = true;
	var s = irandom(2);
	switch s{
		case 0: audio_play_sound(sound_cmd_yes,1,false); break;
		case 1: audio_play_sound(sound_cmd_commands,1,false); break;
		case 2:	audio_play_sound(sound_cmd_orders,1,false);	break;
	}
	exit;
}