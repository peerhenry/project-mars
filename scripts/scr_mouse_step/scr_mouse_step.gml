if(global.hovering_over_HUD)
{
	is_dragging	= false;
	exit; // HUD clicks must not propagate here.
}

#region SET DRAGGING

if(mouse_check_button_pressed(mb_left))
{
	click_x = mouse_x;
	click_y = mouse_y;
}
	
// Drag
var drag_released = false;
var left_released = false;

if(mouse_check_button(mb_left))
{
	// larger than 5 pixels
	var sig_x = abs(mouse_x - click_x) > 5;
	var sig_y = abs(mouse_y - click_y) > 5;
	if(sig_x || sig_y)
	{
		is_dragging	= true;
	}
	else
	{
		is_dragging	= false;
	}
}

#endregion

#region CONSTRUCTION INPUT

var constr_type = scr_get_selected_constr_type();
if(constr_type != noone) // BUILD MODE
{
	// Left pressed: set click origin and hide astronaut panels
	if(mouse_check_button_pressed(mb_left))
	{
		scr_hide_all_panels();
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
		scr_hide_categories();
	}
	
	exit;
}
#endregion

#region ASTRONAUT SELECT/ORDERS INPUT

var just_selected_any_astro = false;

if(!is_dragging)
{
	// LEFT CLICK: set click origin for dragging
	if( mouse_check_button_pressed(mb_left) )
	{
		scr_hide_categories(); // hide construction menu
	}
	
	if( mouse_check_button_released(mb_right) )
	{
		// deselect everything
		scr_hide_categories();
		scr_hide_all_panels();
		var hover_astro = instance_position(mouse_x, mouse_y, obj_astronaut_playable);
		if(hover_astro != noone) hover_astro.show_details = true;
		else scr_command(mouse_x, mouse_y);
	}
	
	// Left release & not dragging
	// Either select 1 astronaut or command selected astronauts
	if(mouse_check_button_released(mb_left))
	{
		scr_hide_all_panels();
		var single_select_astro = instance_position(mouse_x, mouse_y, obj_astronaut_playable);
		if(single_select_astro != noone)
		{
			// deselect other astronauts
			with(obj_astronaut_playable)
			{
				is_selected = false;
			}
			
			single_select_astro.is_selected = true;
			just_selected_any_astro = true;
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
				just_selected_any_astro = true;
			}
			else{
				is_selected = false;
			}
		}
	}
	else // selection rectangle is so small, it only selects if it is contained in astronaut BB
	{
		with(obj_astronaut)
		{
			if(owner == macro_player)
			{
				if(
					rec_left > x - 15  && rec_right < x + 15 &&
					rec_top > y - 15 && rec_bottom < y + 15)
				{
					is_selected = true;
					just_selected_any_astro = true;
				}
				else{
					is_selected = false;
				}
			}
		}
	}
	
	is_dragging = false;
}

#endregion

// play selection sounds
if(just_selected_any_astro)
{
	any_astronauts_selected = true;
	scr_play_selection_sound();
	exit;
}
else if(mouse_check_button_released(mb_left))
{
	// deselect all astronauts
	with(obj_astronaut_playable)
	{
		is_selected = false;
	}
}