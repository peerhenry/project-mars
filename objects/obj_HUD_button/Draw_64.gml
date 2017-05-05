/// @description Insert description here
// You can write your code in this editor

// box
draw_set_color(btn_bg_color);
draw_rectangle(btn_left, btn_top, btn_right, btn_bottom, false);
// outline
draw_set_color(c_black);
draw_rectangle(btn_left, btn_top, btn_right, btn_bottom, true);
// text
draw_set_halign(fa_middle); draw_set_valign(fa_middle);
draw_set_font(font_hud);
draw_set_color(btn_color);
draw_text(btn_center_x, btn_center_y, btn_text);