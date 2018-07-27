/// @arg click_item
/// @arg unit
var callback_item = argument0;
var unit = argument1;

switch(callback_item.click_action)
{
	case details_panel_action.deselect:
		unit.is_selected = false;
		if(unit.object_index == obj_cart && unit.deploy)
		{
			unit.deploy = false;
			scr_ghost_reset();
		}
		instance_destroy();
		break;
	case details_panel_action.center:
		scr_center_screen_on(unit);
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
			callback_item.sprite_button_color = c_aqua;
		}
		else callback_item.sprite_button_color = c_black;
		break;
		
	case details_panel_action.deploy:
		with(unit)
		{
			if(carrying_instance != noone)
			{
				event_user(macro_toggle_deploy_event);
				if(deploy) callback_item.sprite_button_color = c_aqua;
				else callback_item.sprite_button_color = c_black;
			}
		}
		break;
	
	case details_panel_action.takeoff:
		f_transit_modules("takeoff", [unit]);
		break;
}