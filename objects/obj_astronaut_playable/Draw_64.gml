var width = 384;
var height = 256;
var tl_x = display_get_gui_width() - width;
var tl_y = 0;

if(show_details)
{
	// panel
	draw_set_color(c_dkgray);
	draw_set_alpha(0.8);
	draw_rectangle(tl_x, tl_y, tl_x + width, tl_y + height, false);
	
	draw_set_color(c_ltgray);
	draw_line(tl_x, tl_y, tl_x + width, tl_y);
	draw_line(tl_x, tl_y, tl_x, tl_y + height);
	
	draw_set_color(c_black);
	draw_line(tl_x + width, tl_y, tl_x + width, tl_y + height);
	draw_line(tl_x, tl_y + height, tl_x +width, tl_y + height);
	
	draw_set_alpha(1);
	
	draw_set_color(c_black);
	var av_w = 96;
	var av_h = 96;
	var av_x = tl_x + width - 16 - av_w;
	var av_y = tl_y + 16
	draw_rectangle(av_x, av_y, av_x + av_w, av_y + av_h, false);
	
	// text
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var x_or = tl_x + 8;
	draw_text(x_or, tl_y + 16, name);
	var half_bar = 8;
	var bar_x_or = tl_x + 128;
	
	draw_set_valign(fa_middle);
	var health_line_y = tl_y + 128;
	draw_text(x_or, health_line_y, "Health");
	draw_healthbar(bar_x_or, health_line_y - half_bar, tl_x + width - 16, health_line_y + half_bar, astronaut_health, 0, c_red, c_green, 0, false, false);
	
	var oxygen_line_y = tl_y + 128 + 24;
	draw_text(x_or, oxygen_line_y, "Oxygen");
	draw_healthbar(bar_x_or, oxygen_line_y - half_bar, tl_x + width - 16, oxygen_line_y + half_bar, suit_oxygen, 0, c_red, c_blue, 0, false, false);
	
	var energy_line_y = tl_y + 128 + 48;
	draw_text(x_or, energy_line_y, "Energy");
	draw_healthbar(bar_x_or, energy_line_y - half_bar, tl_x + width - 16, energy_line_y + half_bar, energy, 0, c_red, c_yellow, 0, false, false);
	
	var food_line_y = tl_y + 128 + 72;
	draw_text(x_or, food_line_y, "Food");
	draw_healthbar(bar_x_or, food_line_y - half_bar, tl_x + width - 16, food_line_y + half_bar, food_level, 0, c_red, c_olive, 0, false, false);
}