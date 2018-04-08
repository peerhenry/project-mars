/// @description Click callback

switch(callback_item.click_action)
{
	case details_panel_action.deselect:
		unit.is_selected = false;
		instance_destroy();
		break;
	case details_panel_action.center:
		scr_center_screen_on(unit);
		break;
	case details_panel_action.deploy:
		with(unit)
		{
			event_user(macro_toggle_deploy_event);
			if(deploy) other.sprite_color = c_aqua;
			else other.sprite_color = c_black;
		}
		break;
	case details_panel_action.show_grid_details:
		var make_new_one = true;
		var this_grid = callback_item.grid;
		with(obj_HUD_grid_details_panel)
		{
			if(this_grid == grid) make_new_one = false;
			instance_destroy();
		}
		if(make_new_one)
		{
			var grid_panel = instance_create_depth(id, this_grid, 0, obj_HUD_grid_details_panel);
		}
		break;
}