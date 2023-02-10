/// @arg movable
function scr_lr_on_movable(argument0) {
	var arg_movable = argument0;

	var add_to_selection = keyboard_check(vk_shift) || keyboard_check(vk_control);
	if(add_to_selection) arg_movable.is_selected = !arg_movable.is_selected;
	else 
	{
		scr_deselect_all();
		arg_movable.is_selected = true;
	}

	if(arg_movable.is_selected)
	{
		if(scr_instance_inherits(arg_movable, obj_astronaut)) scr_play_astro_selection_sound(); // play a random selection sound; todo: DI
		else resolve_execute(arg_movable.script_container, "play_sound", sound_robot_ask);
	
		// todo: check if this is even supposed to be here
		/*
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
		*/
	}

#region display details panel if 1 is selected after release

	var selection_count = 0;
	var last_selected = noone;
	with(obj_movable)
	{
		if(is_selected)
		{
			selection_count++;
			last_selected = id;
		}
	}

	if(selection_count == 1)
	{
		global.hud_details_panel = scr_create_hud_details_panel(last_selected);
	}

#endregion


}
