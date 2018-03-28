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
		with(unit) event_user(macro_toggle_deploy_event);
		break;
	case details_panel_action.show_grid_details:
		show_debug_message("details_panel_action.show_grid_details");
		var exists = false;
		with(obj_HUD_grid_details_panel)
		{
			exists = true;
			instance_destroy();
		}
		if(!exists)
		{
			var grid_panel = instance_create_depth(id, callback_item.grid, 0, obj_HUD_grid_details_panel);
		}
		break;
}