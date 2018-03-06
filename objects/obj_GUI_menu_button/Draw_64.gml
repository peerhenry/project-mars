if(mouse_over)
{
	if(mouse_check_button_pressed(mb_left)) scr_draw_panel_inverse(x, y, x+width, y+height);
	else scr_draw_panel_light(x, y, x+width, y+height);
}
else
{
	scr_draw_panel(x, y, x+width, y+height);
}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(font_hud);
draw_text( x + width/2, y + height/2, text );