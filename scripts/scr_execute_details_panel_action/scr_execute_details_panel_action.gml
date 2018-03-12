/// @arg panel
/// @arg action
var arg_panel = argument0;
var arg_action = argument1;

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
}