/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(font_menu);
draw_set_color(c_white);

var m;
for(m = 0; m <= menu_index_max; m++)
{
	if(m == menu_index.debug || m == menu_index.quit || m == menu_index.settings)
	{
		draw_set_color(c_white);
	}
	else draw_set_color(c_gray);
	
	str_Name = menu[m];
	string_width(str_Name + " ");
	var ox = x + space;
	var oy = y + m * space;
	w = string_width(str_Name + " ");
	h = string_height(str_Name);
	
	draw_text(ox, oy, str_Name);
	
	if(mouse_x > ox && mouse_x < ox + w && mouse_y > oy && mouse_y < oy + h){
		menu_focus_index = m;
	}
}

draw_sprite(sprite_index, image_index, x + 16, y + menu_focus_index * space )