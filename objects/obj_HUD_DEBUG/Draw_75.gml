
draw_set_font(font_hud);
draw_set_color(c_yellow);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

var dy = 0;
for(var i = 0; i < array_length_1d(message_lines); i++)
{
	draw_text(1920/2, 32 + dy, message_lines[i]);
	dy += 32;
}