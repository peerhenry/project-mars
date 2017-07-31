draw_set_color(c_black);
draw_rectangle(text_x - 512, text_y - half_height, text_x + 512, text_y + half_height, false);
draw_set_color(c_white);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(text_x, text_y, text);