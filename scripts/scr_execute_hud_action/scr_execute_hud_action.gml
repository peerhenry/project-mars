/// @arg button
var arg_button = argument0;

switch( arg_button[? "action"] )
{
	case hud_action.toggle_astro_panels:
		var open = arg_button[? "active"];
		arg_button[? "active"] = !open;
		if(open)
		{
			// destroy astro panels
			with(obj_HUD_entity_panel)
			{
				if(scr_instance_inherits(entity, obj_astronaut)) instance_destroy();
			}
		}
		else // create astro panels
		{
			with(obj_astronaut)
			{
				if(owner == macro_player)
				{
					var panel = instance_create_depth(0,0,0,obj_HUD_entity_panel);
					panel.entity = id;
				}
			}
		}
		break;
	case hud_action.toggle_robot_panels:
		var open = arg_button[? "active"];
		arg_button[? "active"] = !open;
		if(open)
		{
			// close all robot panels
			with(obj_HUD_entity_panel)
			{
				if(scr_instance_inherits(entity, obj_robot)) instance_destroy();
			}
		}
		else // create robot panels
		{
			with(obj_robot)
			{
				if(owner == macro_player)
				{
					var panel = instance_create_depth(0,0,0,obj_HUD_entity_panel);
					panel.entity = id;
				}
			}
		}
		break;
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
}