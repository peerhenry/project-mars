var right = x + width;
var bottom = y + height;
var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var hovers = 
		window_mouse_x > x
		&& window_mouse_x < right
		&& window_mouse_y > y
		&& window_mouse_y < bottom;

draw_set_alpha(0.9);
var c_top = color_top;
var c_bottom = color_bottom;
if(hovers)
{
	if(mouse_check_button(mb_left))
	{
		c_top = color_down_top;
		c_bottom = color_down_bottom;
	}
	else
	{
		c_top = color_hover_top;
		c_bottom = color_hover_bottom;
	}
}
else
{
	draw_rectangle_color(x, y, right, bottom, c_dkgray, c_dkgray, c_black, c_black, false);
}

draw_rectangle_color(left, top, right, bottom, c_top, c_top, c_bottom, c_bottom, false);
draw_set_alpha(1.0);

if(sprite != noone)
{
	var colour = c_black;
	if(active) colour = c_aqua;
	draw_sprite_ext( sprite, subimg, x + padding_x, y + padding_y, 1, 1, 0, colour, 1 );
}
else
{
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
	draw_set_color(text_color);
	draw_text(x + padding_x, y + padding_y, text);
}