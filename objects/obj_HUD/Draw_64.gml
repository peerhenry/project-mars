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

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
for(var n = 0; n< ds_list_size(buttons); n++)
{
	var button = buttons[| n];
	var hovers = 
		window_mouse_x > button[? "left"] 
		&& window_mouse_x < button[? "right"]
		&& window_mouse_y > button[? "top"] 
		&& window_mouse_y < button[? "bottom"];
	scr_draw_hud_button(button, hovers);
}

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

/*
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
	draw_healthbar(hbx, hby, hbx + bw, hby + 22, sleep_level, c_black, sc, sc, 3, true, true);
	if(sleep_level < 20 && other.flash_counter > 15)
	{
		draw_rectangle(hbx - 1, hby - 1, hbx + bw + 1, hby + 22 + 1, true);
	}
	// oxygen bar
	if(wears_suit)
	{
		hbx = hbx - bspace - bw;
		draw_healthbar(hbx, hby, hbx + bw, hby + 22, suit_oxygen, c_black, oc, oc, 3, true, true);
		if(suit_oxygen < 20 && other.flash_counter > 15)
		{
			draw_rectangle(hbx - 1, hby - 1, hbx + bw + 1, hby + 22 + 1, true);
		}
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
	var c_attack = c_dkgray;
	if(auto_attack) c_attack = c_aqua;
	var c_construct = c_dkgray;
	if(auto_construct) c_construct = c_aqua;
	var c_sleep = c_dkgray;
	if(auto_sleep)
	{
		c_sleep = c_red;
		with(obj_bed)
		{
			if(owner = macro_player)
			{
				if(occupant != noone) c_sleep = c_yellow;
				else{
					c_sleep = c_aqua;
					break;
				}
			}
		}
	}
	var c_food = c_dkgray;
	if(auto_eat)
	{
		c_food = c_red;
		var there_is_hydroponics = false;
		with(obj_hydroponics) if(owner = macro_player) { there_is_hydroponics = true; break; }
		with(obj_fridge)
		{
			if(owner = macro_player)
			{
				if(!scr_inventory_has_item(inventory, macro_inventory_food))
				{
					if(there_is_hydroponics) c_food = c_yellow;
				}
				else{
					c_food = c_aqua;
					break;
				}	
			}
		}
	}
	
	draw_sprite_ext(spr_auto_attack_small, 2, icon_x_or + icon_offset * counter, icon_top, 1, 1, 0, c_attack, 1);
	counter++;
	draw_sprite_ext(spr_auto_construct_small, 2, icon_x_or + icon_offset * counter, icon_top, 1, 1, 0, c_construct, 1);
	counter++;
	draw_sprite_ext(spr_auto_sleep_small, 2, icon_x_or + icon_offset * counter, icon_top, 1, 1, 0, c_sleep, 1);
	counter++;
	draw_sprite_ext(spr_auto_feed_small, 2, icon_x_or + icon_offset * counter, icon_top, 1, 1, 0, c_food, 1);
	
	// increment offset
	offset = offset + other.ap_offset;
}
*/
#endregion

#region TOOLTIPS
/*
// hover over astro tooltip
var astro = instance_position(mouse_x, mouse_y, obj_astronaut_playable);
var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var tt_x = window_mouse_x + 16;
var tt_y = window_mouse_y + 16;
if(!global.hovering_over_HUD && astro != noone)
{	
	scr_draw_hud_tooltip(tt_x, tt_y, astro.name);
}
else if(hover_astro != noone) // hud hover astro
{
	switch(other.hover_part)
	{
		case hud_part.auto_attack:
			scr_draw_hud_tooltip(tt_x, tt_y, "toggle auto attack");
			break;
		case hud_part.auto_construct:
			scr_draw_hud_tooltip(tt_x, tt_y, "toggle auto construct");
			break;
		case hud_part.auto_eat:
			scr_draw_hud_tooltip(tt_x, tt_y, "toggle auto eat");
			break;
		case hud_part.auto_sleep:
			scr_draw_hud_tooltip(tt_x, tt_y, "toggle auto sleep");
			break;
		case hud_part.food_bar:
			scr_draw_hud_tooltip(tt_x, tt_y, "food: " + string(hover_astro.food_level));
			break;
		case hud_part.sleep_bar:
			scr_draw_hud_tooltip(tt_x, tt_y, "sleep: " + string(hover_astro.sleep_level));
			break;
		case hud_part.oxygen_bar:
			scr_draw_hud_tooltip(tt_x, tt_y, "oxygen: " + string(hover_astro.suit_oxygen));
			break;
	}
}
*/
var tile = instance_position(mouse_x, mouse_y, obj_base_tile);
var comp = instance_position(mouse_x, mouse_y, obj_base_component);
if(tile != noone && comp == noone)
{
	var window_mouse_x = window_mouse_get_x();
	var window_mouse_y = window_mouse_get_y();
	var tt_x = window_mouse_x + 16;
	var tt_y = window_mouse_y + 16;
	var le_room = scr_room_at(mouse_x, mouse_y);
	scr_draw_hud_tooltip(tt_x, tt_y, "oxygen: " + string(le_room.oxygen_level) + "%");
}

#endregion