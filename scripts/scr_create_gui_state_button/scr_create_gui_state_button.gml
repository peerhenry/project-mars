/// @arg container
/// @arg x
/// @arg y
/// @arg sprite
/// @arg pad
/// @arg action
/// @arg get_state_script
function scr_create_gui_state_button(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	var arg_container = argument0;
	var arg_left = argument1;
	var arg_top = argument2;
	var arg_sprite = argument3;
	var arg_pad = argument4;
	var arg_action = argument5;
	var arg_get_state_script = argument6;

	var button = scr_create_gui_item_icon_button(arg_container, arg_left, arg_top, arg_sprite, arg_pad, arg_action);
	button.get_state_script = arg_get_state_script;
	return button;


}
