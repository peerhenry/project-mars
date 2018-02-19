#region MENU BUTTON
// box
var color = global.btn_bg_color;
if(mouse_over_menu) color = global.btn_bg_color_hover;
draw_set_color(color);
draw_rectangle(menu_btn_left, menu_btn_top, menu_btn_right, menu_btn_bottom, false);
// outline
draw_set_color(c_black);
draw_rectangle(menu_btn_left, menu_btn_top, menu_btn_right, menu_btn_bottom, true);
// text
draw_set_halign(fa_center); 
draw_set_valign(fa_middle);
draw_set_font(font_hud);
draw_set_color(global.btn_color);
draw_text(menu_btn_center_x, menu_btn_center_y, "Menu");
#endregion

#region RESOURCE COUNTER
// box
draw_set_color(global.btn_bg_color);
draw_rectangle(resources_left, resources_top, resources_right, resources_bottom, false);
// outline
draw_set_color(c_black);
draw_rectangle(resources_left, resources_top, resources_right, resources_bottom, true);
// text
draw_set_halign(fa_center); 
draw_set_valign(fa_middle);
draw_set_font(font_hud);
draw_set_color(global.btn_color);
draw_text(resources_center_x, resources_center_y, "Metal: " + string(scr_get_metal_amount()));
#endregion

#region BUILD PANEL
// draw background
draw_set_color(c_black);
// draw_rectangle(x_offset, y_offset, x_offset + 31, y_offset + (32 + y_spacing)*build_count - y_spacing, false);
draw_rectangle(
	0, 
	y_offset - padding, 
	x_offset + 31 + padding, 
	y_offset + (32 + y_spacing)*item_count - y_spacing + padding, 
	false);

draw_set_color(c_teal);
draw_set_alpha(0.3);
draw_rectangle(
	2, 
	y_offset - 10, 
	x_offset + 31 + 10, 
	y_offset + (32 + y_spacing)*item_count - y_spacing + 10, 
	false);
draw_set_alpha(1);
#endregion

#region ASTRONAUT PANELS

var offset = 0;
with(obj_astronaut_playable)
{
	var ap_left = other.ap_origin_left;
	var ap_right = ap_left + other.ap_w;
	var ap_top = other.ap_origin_top + offset;
	var ap_bottom = ap_top + other.ap_h;
	var name_x = ap_left + other.ap_padding;
	var name_y = ap_top + other.ap_padding;
	
	// draw panel
	draw_set_color(c_dkgray);
	draw_set_alpha(0.7);
	draw_rectangle(ap_left, ap_top, ap_right, ap_bottom, false);
	draw_set_alpha(1.0);
	if(is_selected)
	{
		draw_set_color(c_aqua);
		draw_rectangle(ap_left, ap_top, ap_right, ap_bottom, true);
	}
	
	// draw name
	draw_set_font(font_small);	
	draw_set_color(c_silver);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(name_x, name_y, name);
	
	// draw healthbat
	var healthbar_x = name_x;
	var healthbar_y = ap_bottom - 2 - other.ap_padding;
	draw_healthbar(healthbar_x, healthbar_y, name_x + other.ap_name_w, healthbar_y + 2, astronaut_health, c_black, c_red, c_lime, 0, true, false);
	
	// draw auto icons
	var counter = 0;
	var icon_x_or = name_x + other.ap_name_w + other.ap_padding;
	var icon_top = name_y;
	var icon_offset = (16 + other.ap_padding);
	draw_sprite(spr_auto_attack_small, auto_attack, icon_x_or + icon_offset * counter, icon_top);
	counter++;
	draw_sprite(spr_auto_construct_small, auto_construct, icon_x_or + icon_offset * counter, icon_top);
	counter++;
	draw_sprite(spr_auto_sleep_small, auto_sleep, icon_x_or + icon_offset * counter, icon_top);
	counter++;
	draw_sprite(spr_auto_feed_small, auto_eat, icon_x_or + icon_offset * counter, icon_top);
	
	// increment offset
	offset = offset + other.ap_offset;
}

#endregion

#region HOVER ASTRO NAME

var astro = instance_position(mouse_x, mouse_y, obj_astronaut_playable);
if(astro != noone)
{
	var window_mouse_x = window_mouse_get_x();
	var window_mouse_y = window_mouse_get_y();
	draw_set_font(font_small);
	var sw = string_width(astro.name);
	var sh = string_height(astro.name);
	// box
	draw_set_color(c_dkgray);
	draw_set_alpha(0.9);
	draw_rectangle(window_mouse_x, window_mouse_y, window_mouse_x + sw + 8, window_mouse_y + sh + 8, false);
	// outline
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_rectangle(window_mouse_x, window_mouse_y, window_mouse_x + sw + 8, window_mouse_y + sh + 8, true);
	// text
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(window_mouse_x + 4, window_mouse_y + 4, astro.name);
}

#endregion