/// @arg arg_button_dto
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

draw_set_alpha(0.9);
var c_top = arg_button.color_top;
var c_bottom = arg_button.color_bottom;
if(arg_hovers)
{
	if(mouse_check_button(mb_left) && arg_press_button == arg_button)
	{
		c_top = arg_button.color_down_top;
		c_bottom = arg_button.color_down_bottom;
	}
	else if(arg_press_button == noone)
	{
		c_top = arg_button.color_hover_top;
		c_bottom = arg_button.color_hover_bottom;
	}
}
else
{
	// draw_rectangle_color(left, top, right, bottom, c_dkgray, c_dkgray, c_black, c_black, false);
}

draw_rectangle_color(left, top, right, bottom, c_top, c_top, c_bottom, c_bottom, false);
draw_set_alpha(1.0);

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