/// @arg gui_container
/// @arg right
/// @arg top
var arg_container = argument0;
var arg_right = argument1;
var arg_top = argument2;

var button_w = 24;
var button_h = 24;
// Deselect button
var ds_btn = scr_create_gui_item_icon_button(arg_container, arg_right - button_w, arg_top - button_h - 1, spr_deselect_icon, 4, details_panel_action.deselect);
ds_btn.tooltip_text = "Deselect unit";
// Center cam button
var center_button = scr_create_gui_item_icon_button(arg_container, arg_right - button_w*2 - 1, arg_top - button_h - 1, spr_center_cam_icon, 4, details_panel_action.center);
center_button.tooltip_text = "Center camera on unit";