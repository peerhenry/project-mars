/// @arg hud
/// @arg x
/// @arg y
/// @arg font
/// @arg text
/// @arg action
function scr_add_hud_button_text(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	var hud = argument0;
	var arg_x = argument1;
	var arg_y = argument2;
	var font = argument3;
	var text = argument4;
	var arg_padding = argument5;
	var arg_action = argument6;

	draw_set_font(font);
	var sh = string_height(text);
	var sw = string_width(text);

	scr_add_hud_button_ext(hud, arg_x, arg_y, font, text, arg_padding, arg_padding, noone, arg_action);


}
