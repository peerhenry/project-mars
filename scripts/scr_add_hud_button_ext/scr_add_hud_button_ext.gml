/// @arg hud
/// @arg left
/// @arg right
/// @arg top
/// @arg bottom
/// @arg font
/// @arg text
/// @arg text_x
/// @arg text_y
/// @arg sprite
/// @arg hud_action
var hud = argument0;
var l = argument1;
var r = argument2;
var t = argument3;
var b = argument4;
var font = argument5;
var text = argument6;
var text_x = argument7;
var text_y = argument8;
var sprite = argument9;
var arg_action = argument10;

var new_button = instance_create_depth(0,0,0,dto_hud_bar_button);
new_button.sprite = sprite;
new_button.font = font;
new_button.text = text;
new_button.text_x = text_x;
new_button.text_y = text_y;
new_button.top = t;
new_button.bottom = b;
new_button.left = l;
new_button.right = r;
new_button.width = r-l;
new_button.height = b-t;
new_button.action = arg_action;
new_button.active = false;
new_button.color_top = c_teal;
new_button.color_bottom = c_gray;
new_button.color_hover_top = c_aqua;
new_button.color_hover_bottom = c_ltgray;
new_button.color_down_top = c_dkgray;
new_button.color_down_bottom = c_black;

// set tooltip based on action
switch(arg_action)
{
	case hud_action.toggle_objectives:
		new_button.tooltip_text = "Objectives";
		break;
	case hud_action.mission_control:
		new_button.tooltip_text = ("Mission control");
		break;
	case hud_action.toggle_menu:
		new_button.tooltip_text = ("Menu");
		break;
	case hud_action.toggle_outliner:
		new_button.tooltip_text = ("Toggle outliner");
		break;
	case hud_action.toggle_minimap:
		new_button.tooltip_text = ("Toggle minimap");
		break;
	case hud_action.toggle_high_walls:
		new_button.tooltip_text = ("Toggle high walls");
		break;
	case hud_action.toggle_zoom:
		new_button.tooltip_text = ("Toggle zoom");
		break;
}

with(hud) ds_list_add(buttons, new_button);

return new_button;