draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(font_menu);
draw_set_color(c_white);

//draw menu items
for(var m = 0; m < array_length_1d(menu); m++)
{
	draw_set_color(colors[m]);
	draw_text(x + space, y + m * space, menu[m]);
}

//draw focus indicator arrow sprite
draw_sprite(sprite_index, image_index, x + 16, y + menu_focus_index * space )