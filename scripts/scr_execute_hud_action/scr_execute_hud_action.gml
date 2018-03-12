/// @arg button
var arg_button = argument0;

switch( arg_button.action )
{
	case hud_action.toggle_menu:
		with(gui_menu) event_user(0); // toggle menu
		with(obj_gui_menu)
		{
			if(id != other.gui_menu) event_user(1); // close other menus
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
		}
		break;
}