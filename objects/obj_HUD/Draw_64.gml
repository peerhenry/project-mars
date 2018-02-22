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
	
	// draw need bars (vertically)
	var oc = global.oxygen_bar_color;
	var sc = global.sleep_bar_color;
	var fc = global.food_bar_color;
	
	/*var obc = c_black;
	var fbc = c_black;
	var sbc = c_black;
	if(energy < 20 && other.flash_counter > 15) sbc = c_red;
	if(food_level < 20 && other.flash_counter > 15) fbc = c_red;*/
	
	var healthbar_x = name_x;
	var healthbar_y = ap_bottom - 2 - other.ap_padding;
	
	var bw = 3;
	var bspace = 5;
	var hby = healthbar_y-20;
	draw_set_color(c_red);
	// food_level bar
	var hbx = name_x + other.ap_name_w - bw;
	draw_healthbar(hbx, hby, hbx + bw, hby + 22, food_level, c_black, fc, fc, 3, true, true);
	if(food_level < 20 && other.flash_counter > 15)
	{
		draw_rectangle(hbx - 1, hby - 1, hbx + bw + 1, hby + 22 + 1, true);
	}
	// sleep bar
	hbx = hbx - bspace - bw;
	draw_healthbar(hbx, hby, hbx + bw, hby + 22, energy, c_black, sc, sc, 3, true, true);
	if(energy < 20 && other.flash_counter > 15)
	{
		draw_rectangle(hbx - 1, hby - 1, hbx + bw + 1, hby + 22 + 1, true);
	}
	// oxygen bar
	hbx = hbx - bspace - bw;
	draw_healthbar(hbx, hby, hbx + bw, hby + 22, suit_oxygen, c_black, oc, oc, 3, true, true);
	if(suit_oxygen < 20 && other.flash_counter > 15)
	{
		draw_rectangle(hbx - 1, hby - 1, hbx + bw + 1, hby + 22 + 1, true);
	}
	
	// draw healthbar
	var hc = health_bar_color;
	if(entity_health < 20) hc = c_red;
	else if(entity_health < 100) hc = c_yellow;
	draw_healthbar(healthbar_x, healthbar_y, hbx - bspace, healthbar_y + 2, entity_health, c_black, hc, hc, 0, true, true);
	
	
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
	var tt_x = window_mouse_x + 16;
	var tt_y = window_mouse_y + 16;
	// box
	draw_set_color(c_dkgray);
	draw_set_alpha(0.9);
	draw_rectangle(tt_x, tt_y, tt_x + sw + 8, tt_y + sh + 8, false);
	// outline
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_rectangle(tt_x, tt_y, tt_x + sw + 8, tt_y + sh + 8, true);
	// text
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(tt_x + 4, tt_y + 4, astro.name);
}

#endregion