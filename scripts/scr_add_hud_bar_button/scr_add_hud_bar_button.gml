/// @arg hud
/// @arg x
/// @arg y
/// @arg font
/// @arg text
/// @arg action
var hud = argument0;
var arg_x = argument1;
var arg_y = argument2;
var font = argument3;
var text = argument4;
var arg_action = argument5;

draw_set_font(font);
// var sh = string_height(text);
// var sw = string_width(text);

var button = scr_add_hud_button_ext(
	hud, 
	arg_x, 
	arg_x + 108, 
	arg_y, 
	arg_y + hud.hud_bar_h, 
	font, 
	text, 
	arg_x + 54, 
	arg_y + hud.hud_bar_h/2, 
	noone, 
	arg_action
);

button[? "bar_button"] = true;