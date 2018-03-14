if(hover)
{
	if(mouse_check_button_pressed(mb_left)) scr_draw_panel_inverse(left, top, right, bottom);
	else scr_draw_panel_light(left, top, right, bottom);
}
else scr_draw_panel(left, top, right, bottom);

draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(font_hud);
draw_set_color(c_white);
draw_text(x, y, text);