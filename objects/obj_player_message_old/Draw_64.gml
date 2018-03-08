var margin_top = 20;
var pad = 8;
var l = 0;
var r = 200;
var t = margin_top;
var b = t + 200;
draw_set_color(c_teal);
draw_rectangle(l, t, r, b, false);
draw_set_color(c_black);
draw_rectangle(l, t, r, b, true);

draw_set_color(c_white);
draw_set_font(font);
draw_set_halign(fa_top);
draw_set_valign(fa_left);
draw_text(l + p, t + p + margin_top, text);