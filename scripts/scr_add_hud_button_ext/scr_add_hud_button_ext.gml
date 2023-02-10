/// @arg hud
/// @arg arg_x
/// @arg arg_y
/// @arg font
/// @arg text
/// @arg padding_x
/// @arg padding_y
/// @arg sprite
/// @arg hud_action
function scr_add_hud_button_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	var hud = argument0;
	var arg_x = argument1;
	var arg_y = argument2;
	var font = argument3;
	var text = argument4;
	var padding_x = argument5;
	var padding_y = argument6;
	var sprite = argument7;
	var arg_action = argument8;

	//todo: refactor all scr_add_hud_b*() funcs

	var new_button = instance_create_depth(arg_x, arg_y, 0, dto_hud_bar_button);
	new_button.sprite = sprite;
	new_button.font = font;
	new_button.text = text;
	new_button.padding_x = padding_x;
	new_button.padding_y = padding_y;
	new_button.width = 36; //todo: auto size for text content
	new_button.height = 36; //todo: non hardcoded values for x/y?
	new_button.anchor = 0;
	new_button.action = arg_action;
	new_button.active = false;
	new_button.color_top = c_teal;
	new_button.color_bottom = c_gray;
	new_button.color_hover_top = c_aqua;
	new_button.color_hover_bottom = c_ltgray;
	new_button.color_down_top = c_dkgray;
	new_button.color_down_bottom = c_black;

	// set tooltip and anchor based on action
	switch(arg_action)
	{
		case hud_action.toggle_objectives:
			new_button.tooltip_text = "Objectives";
			new_button.anchor = -1;
			break;
		case hud_action.mission_control:
			new_button.tooltip_text = ("Mission control");
			new_button.anchor = -1;
			break;
		case hud_action.toggle_menu:
			new_button.tooltip_text = ("Menu");
			new_button.anchor = 1;
			break;
		case hud_action.toggle_outliner:
			new_button.tooltip_text = ("Toggle outliner");
			new_button.anchor = 1;
			break;
		case hud_action.toggle_minimap:
			new_button.tooltip_text = ("Toggle minimap");
			new_button.anchor = 1;
			break;
		case hud_action.toggle_high_walls:
			new_button.tooltip_text = ("Toggle high walls");
			new_button.anchor = 1;
			break;
		case hud_action.toggle_zoom:
			new_button.tooltip_text = ("Toggle zoom");
			new_button.anchor = 1;
			break;
	}

	with(hud) ds_list_add(buttons, new_button);

	return new_button;


}
