if(global.hovering_over_HUD) return; // HUD clicks must not propagate here.

// CONSTRUCTION INPUT

if(global.construct != noone)
{
	if(mouse_check_button_pressed(mb_left))
	{
		click_x = mouse_x;
		click_y = mouse_y;
	}
	
	if(mouse_check_button(mb_left))
	{
		if(mouse_x != click_x && mouse_y != click_y)
		{
			is_dragging	= true;
		}
		else {
			is_dragging	= false;
		}
	}
	
	if(mouse_check_button_released(mb_left))
	{
		//scr_construct(global.construct);
		scr_build(mouse_x, mouse_y, global.construct, global.build_rotation);
	}
	
	if(mouse_check_button_pressed(mb_right))
	{
		global.construct = noone;
	}
	
	return;
}

// ASTRONAUT SELECT/ORDERS INPUT

var orders_given = false;
var just_selected = false;
if(!is_dragging)
{
	// LEFT CLICK
	if(mouse_check_button_pressed(mb_left))
	{
		// set click origin for selection rectangle
		click_x = mouse_x;
		click_y = mouse_y;
	}
	
		// LEFT DOWN
	if(mouse_check_button(mb_left))
	{
		if(mouse_x != click_x && mouse_y != click_y)
		{
			is_dragging	= true;
		}
		else {
			is_dragging	= false;
		}
	}
	
	// LEFT RELEASE
	if(mouse_check_button_released(mb_left))
	{
		with(obj_character)
		{
			if(mouse_x < x + 15 && mouse_x > x - 15 && mouse_y < y + 15 && mouse_y > y -15)
			{
				just_selected = true;
				is_selected = true;
			}
			else
			{
				// important! astronauts must be deselectable.
				is_selected = false;
			}
		}
	}
	
	// RIGHT CLICK
	if(mouse_check_button_pressed(mb_right))
	{
		if(any_astronauts_selected)
		{
			scr_command();
		}
		global.construct = noone;
	}
}
else if(mouse_check_button_released(mb_left))
{
	var rec_left = min(click_x, mouse_x);
	var rec_right = max(click_x, mouse_x);
	var rec_top = min(click_y, mouse_y);
	var rec_bottom = max(click_y, mouse_y);
	
	// selection rectangle must contain a tile center
	if(rec_right - rec_left > 15 || rec_bottom - rec_top > 15)
	{
		with(obj_character)
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
	else // selection rectangle is so small, it only selects if its contained
	{
		with(obj_character)
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
}