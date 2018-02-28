var just_selected_any_entity = false;
var selection_includes_astro = false;

var add_to_selection = keyboard_check(vk_shift) || keyboard_check(vk_control);

scr_hide_all_panels();
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
	var single_select_ent = instance_position(mouse_x, mouse_y, obj_grid_selector);
	if(single_select_ent != noone && single_select_ent.owner == macro_player)
	{
		with(single_select_ent)
		{
			global.selected_grid = scr_get_grid(id, grid_type_to_select);
			is_selected = true;
		}
	}
}

// play selection sounds
if( just_selected_any_entity )
{
	if(selection_includes_astro) scr_play_selection_sound();
	exit;
}