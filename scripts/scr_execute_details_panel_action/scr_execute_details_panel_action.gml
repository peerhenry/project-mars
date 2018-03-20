/// @arg panel_component
/// @arg panel
/// @arg action
var arg_panel_component = argument0; // dto_details_panel_component
var arg_panel = argument1;
var arg_action = argument2;

var unit = arg_panel.unit;

switch(arg_action)
{
	case details_panel_action.deselect:
		unit.is_selected = false;
		arg_panel.destroy = true;
		break;
	case details_panel_action.center:
		scr_center_screen_on(unit);
		break;
	case details_panel_action.deploy:
		with(unit) event_user(macro_toggle_deploy_event);
		break;
	case details_panel_action.show_grid_details:
		if(instance_exists(arg_panel.sub_panel))
		{
			with(obj_HUD_grid_details_panel) instance_destroy();
			arg_panel.sub_panel = noone;
		}
		else
		{
			var grid_panel = instance_create_depth(0, 0, 0, obj_HUD_grid_details_panel);
			grid_panel.grid = arg_panel_component.grid;
			arg_panel.sub_panel = grid_panel;
		}
		break;
}