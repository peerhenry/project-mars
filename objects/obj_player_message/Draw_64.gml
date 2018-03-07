var w = 200;
var h = 120;
var margin_left = 8;
var margin_top = 44;
var pad = 4;
var font = font_small;

var l = margin_left;
var r = l + w;
var t = margin_top;
var b = t + h;
draw_set_alpha(0.5);
draw_set_color(c_teal);
draw_rectangle(l, t, r, b, false);
draw_set_alpha(1.0);
draw_set_color(c_aqua);
draw_rectangle(l, t, r, b, true);

draw_set_color(c_white);
draw_set_font(font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
var line_height = font_get_size(font) + 3;
draw_text_ext(
	l + pad, 
	t + pad, 
	text, 
	line_height, 
	w - 2*pad
);