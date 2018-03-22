var just_selected_any_entity = false;
var selection_includes_astro = false;

var add_to_selection = keyboard_check(vk_shift) || keyboard_check(vk_control);

//with(obj_HUD_details_panel) instance_destroy(); // to become obsolet
if( instance_exists(global.hud_details_panel) )
{
	instance_destroy(global.hud_details_panel);
	global.hud_details_panel = noone;
}

var single_select_ent = instance_position(mouse_x, mouse_y, obj_movable);
if(single_select_ent != noone && single_select_ent.owner == macro_player) // (de)select astronaut
{	
	if(add_to_selection)
	{
		single_select_ent.is_selected = !single_select_ent.is_selected;
	}
	else 
	{
		scr_deselect_all();
		single_select_ent.is_selected = true;
	}
	
	if(single_select_ent.is_selected)
	{
		just_selected_any_entity = true;
		if(scr_instance_inherits(single_select_ent, obj_astronaut)) selection_includes_astro = true;
	}
}
else if(single_select_ent == noone) // select grid selector
{
	scr_deselect_all();
	var single_select_ent = instance_position(mouse_x, mouse_y, obj_base_component);
	if(single_select_ent != noone && single_select_ent.owner == macro_player)
	{
		with(single_select_ent)
		{
			is_selected = true;
		}
	}
}

if(single_select_ent != noone)
{
	// instance_create_depth(single_select_ent, 0, 0, obj_HUD_details_panel); // todo: make this obsolete
	global.hud_details_panel = scr_create_hud_details_panel(single_select_ent);
	
	// set cart ghost
	if(
		single_select_ent.object_index == obj_cart 
		&& single_select_ent.carrying_instance != noone
		&& single_select_ent.deploy
	)
	{
		var constr_type = noone;
		switch(single_select_ent.object_index)
		{
			case obj_battery: constr_type = macro_battery; break;
			case obj_oxygen_tank: constr_type = macro_oxygen_tank; break;
			case obj_hydroponics: constr_type = macro_hydroponics; break;
			case obj_suit_closet: constr_type = macro_suit_closet; break;
		}
		scr_ghost_reset_with_constr_type(construction);
	}
}

// play selection sounds
if( just_selected_any_entity )
{
	if(selection_includes_astro) scr_play_astro_selection_sound();
	else audio_play_sound(sound_robot_ask, 1, false);	
}