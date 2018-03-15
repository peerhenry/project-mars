/// @arg arg_button
/// @arg hovers
/// @arg press_button
var arg_button = argument0;
var arg_hovers = argument1;
var arg_press_button = argument2;

var left = arg_button.left;
var top = arg_button.top;
var right = arg_button.right;
var bottom = arg_button.bottom;
var sprite = arg_button.sprite;
var subimg = arg_button.subimg;

if(arg_hovers)
{
	if(mouse_check_button_pressed(mb_left) && arg_press_button == arg_button)
	{
		scr_draw_panel_inverse(left, top, right, bottom);
	}
	else if(arg_press_button == noone)
	{
		scr_draw_panel_light(left, top, right, bottom);
	}
	else scr_draw_panel(left, top, right, bottom);
}
else
{
	scr_draw_panel(left, top, right, bottom);
}

if(sprite != noone)
{
	var colour = c_black;
	if(arg_button.active) colour = c_aqua;
	draw_sprite_ext( sprite, subimg, arg_button.text_x, arg_button.text_y, 1, 1, 0, colour, 1 );
}
else
{
	draw_set_font(arg_button.font);
	draw_set_halign(arg_button.halign);
	draw_set_valign(arg_button.valign);
	draw_set_color(arg_button.text_color);
	draw_text( arg_button.text_x, arg_button.text_y, arg_button.text );
}
