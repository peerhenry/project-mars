if(!global.hovering_over_HUD && scr_get_selected_constr_type() == noone)
{
	global.selected_grid = scr_get_grid(id, grid_type_to_select);
	is_selected = true;
}