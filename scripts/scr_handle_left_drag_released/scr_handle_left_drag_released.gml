var just_selected_any_entity = false;
var selection_includes_astro = false;

var add_to_selection = keyboard_check(vk_shift) || keyboard_check(vk_control);

with(obj_HUD_details_panel) instance_destroy();
var rec_left = min(click_x, mouse_x);
var rec_right = max(click_x, mouse_x);
var rec_top = min(click_y, mouse_y);
var rec_bottom = max(click_y, mouse_y);
	
// selection rectangle must contain a tile center
if(rec_right - rec_left > 15 || rec_bottom - rec_top > 15)
{
	with(obj_movable)
	{
		if(owner == macro_player)
		{
			if(
				x >= rec_left && x <= rec_right &&
				y >= rec_top && y <= rec_bottom)
			{
				is_selected = true;
				just_selected_any_entity = true;
				if(scr_instance_inherits(id, obj_astronaut)) selection_includes_astro = true;
			}
			else if(!add_to_selection) is_selected = false;
		}
	}
}
else // selection rectangle is so small, it only selects if it is contained in astronaut BB
{
	with(obj_movable)
	{
		if(owner == macro_player)
		{
			if(
				rec_left > x - 15  && rec_right < x + 15 &&
				rec_top > y - 15 && rec_bottom < y + 15)
			{
				is_selected = true;
				just_selected_any_entity = true;
				if(scr_instance_inherits(id, obj_astronaut)) selection_includes_astro = true;
			}
			else if(!add_to_selection) is_selected = false;
		}
	}
}
	
is_dragging = false;

var single_select = scr_get_single_selected();
if(single_select != noone)
{
	// abuse x argument as a constructor argument for unit
	instance_create_depth(single_select, 0, 0, obj_HUD_details_panel);
}

// play selection sounds
if( just_selected_any_entity )
{
	if(selection_includes_astro) scr_play_astro_selection_sound();
	else audio_play_sound(sound_robot_ask, 1, false);
}
else if(mouse_check_button_released(mb_left)) scr_deselect_all();