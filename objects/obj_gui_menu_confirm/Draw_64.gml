if(is_active)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(c_white);
	draw_set_font(font_hud);
	draw_text(window_get_width() / 2, (window_get_height() / 2) - (height / 2) - 20, confirm_text);
}