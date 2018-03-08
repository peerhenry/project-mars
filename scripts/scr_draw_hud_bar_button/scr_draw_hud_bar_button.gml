/// @arg arg_button
var arg_button = argument0;
var arg_hovers = argument1;
var left = arg_button[?"left"];
var top = arg_button[?"top"];
var right = arg_button[?"right"];
var bottom = arg_button[?"bottom"];

var sprite = arg_button[?"sprite"];

draw_set_alpha(0.9);
if(arg_hovers)
{
	if(mouse_check_button_pressed(mb_left))
	{
		draw_rectangle_color(left, top, right, bottom, c_black, c_black, c_black, c_black, false);
	}
	else
	{
		draw_rectangle_color(left, top, right, bottom, c_gray, c_gray, c_dkgray, c_dkgray, false);
	}
}
else
{
	draw_rectangle_color(left, top, right, bottom, c_dkgray, c_dkgray, c_black, c_black, false);
}
draw_set_alpha(1.0);

if(sprite != noone)
{
	var colour = c_black;
	if(arg_button[?"active"]) colour = c_aqua;
	draw_sprite_ext( sprite, 0, arg_button[?"text_x"], arg_button[?"text_y"], 1, 1, 0, colour, 1 );
}
else
{
	draw_set_font(arg_button[?"font"]);
	draw_set_halign(arg_button[?"halign"]);
	draw_set_valign(arg_button[?"valign"]);
	draw_set_color(arg_button[?"text_color"]);
	draw_text( arg_button[?"text_x"], arg_button[?"text_y"], arg_button[?"text"] );
}