if(mouse_over)
{
	draw_set_color(c_ltgray);
	draw_set_alpha(0.8);
	draw_rectangle(x, y, x+width, y+height, false);
}
else
{
	scr_draw_panel(x, y, x+width, y+height);
}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text( x + width/2, y + height/2, text );