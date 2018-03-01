/// @arg window_x
/// @arg window_y
/// @arg text
var arg_x = argument0;
var arg_y = argument1;
var arg_text = argument2;
draw_set_font(font_small);
var sw = string_width(arg_text);
var sh = string_height(arg_text);

var gui_w = display_get_gui_width();
var tt_w = sw + 8;
var tt_h = sh + 8;
if(arg_x + sw > gui_w) arg_x = gui_w - tt_w;

// box
draw_set_color(c_dkgray);
draw_set_alpha(0.9);
draw_rectangle(arg_x, arg_y, arg_x + tt_w, arg_y + tt_h, false);
// outline
draw_set_alpha(1.0);
draw_set_color(c_white);
draw_rectangle(arg_x, arg_y, arg_x + tt_w, arg_y + tt_h, true);
// text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(arg_x + 4, arg_y + 4, arg_text);