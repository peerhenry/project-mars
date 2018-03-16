/// @arg button
var arg_action = argument0;

switch( arg_action )
{
	case hud_action.mission_control:
		if(true) //needs user confirm //todo: implement check all objectives accomplished?
		{
			instance_create_layer(scr_quit_to_mission_control, noone, macro_logic_layer, obj_gui_menu_confirm);
			with(obj_gui_menu_confirm)
			{
				event_user(0);
				confirm_text = "Return to Mission Control";
			}
		}
		else //doesn't need confirm
		{
			scr_quit_to_mission_control();
		}
		break;
	case hud_action.toggle_menu:
		var menu_was_active = false;
		with(obj_gui_menu_main) menu_was_active = is_active;
		with(obj_gui_menu) event_user(1); //close all menus
		if(!menu_was_active)
		{
			with(obj_gui_menu_main) event_user(0); //toggle menu
		}
		break;
	case hud_action.toggle_zoom:
		scr_toggle_zoom();
		break;
	case hud_action.toggle_high_walls:
		scr_toggle_tall_walls();
		break;
	case hud_action.toggle_outliner:
		with(obj_HUD)
		{
			if(outliner.active)
			{
				outliner.active = false;
				instance_deactivate_object(outliner);
				with(obj_HUD_entity_panel) instance_destroy();
			}
			else
			{
				instance_activate_object(outliner);
				scr_set_outliner_part(outliner, obj_astronaut, outliner.show_astro_panels);
				scr_set_outliner_part(outliner, obj_robot, outliner.show_robot_panels);
				scr_set_outliner_part(outliner, obj_cart, outliner.show_cart_panels);
				scr_reset_outliner(outliner);
				outliner.active = true;
			}
			outliner.reset = true;
		}
		break;
	case hud_action.toggle_minimap:
		with(obj_HUD)
		{
			if(minimap_is_active)
			{
				// minimap = instance_create_layer(window_get_width() - 200, 40, macro_logic_layer, obj_HUD_minimap);
				instance_deactivate_object(minimap);
				minimap_is_active = false;
			}
			else
			{
				instance_activate_object(minimap);
				minimap_is_active = true;
			}
			outliner.reset = true;
		}
		break;
	case hud_action.toggle_objectives:
		var exists = false;
		with(obj_HUD_objectives)
		{
			instance_destroy();
			exists = true;
		}
		if(!exists) instance_create_depth(0, 0, 0, obj_HUD_objectives);
		break;
}