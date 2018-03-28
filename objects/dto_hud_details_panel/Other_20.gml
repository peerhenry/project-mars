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
		/* todo: implement
		var grid_off = false;
		if(instance_exists(arg_panel.sub_panel))
		{
			with(obj_HUD_grid_details_panel)
			{
				instance_destroy();
				grid_off = grid == arg_panel_component.grid;
			}
			arg_panel.sub_panel = noone;
		}
		if(!grid_off)
		{
			var grid_panel = instance_create_layer(0, 0, macro_logic_layer, obj_HUD_grid_details_panel);
			grid_panel.grid = arg_panel_component.grid;
			arg_panel.sub_panel = grid_panel;
		}
		*/
		break;
}