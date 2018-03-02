var panel_top = global.hud_entity_panel_offset;
var panel_bottom = panel_top + panel_height;
var panel_left = display_get_gui_width() - (panel_width + margin);
var panel_right = panel_left + panel_width;
top = panel_top;
bottom = panel_bottom;
left = panel_left;
right = panel_right;

#region draw panel
draw_set_color(c_dkgray);
draw_set_alpha(0.7);
draw_rectangle(panel_left, panel_top, panel_right, panel_bottom, false);
draw_set_alpha(1.0);
if(entity.is_selected)
{
	draw_set_color(c_aqua);
	draw_rectangle(panel_left, panel_top, panel_right, panel_bottom, true);
}
#endregion

#region draw name & health bar

draw_set_font(font_small);	
draw_set_color(c_silver);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var text = "Cart";
if(entity.object_index == obj_robot) text = "Robot";
else if(scr_instance_inherits(entity, obj_astronaut)) text = entity.name;
draw_text(panel_left + padding, panel_top + padding, text);

global.hud_entity_panel_offset = panel_top + panel_height + panel_spacing;

// health bar
var healthbar_x = panel_left + padding;
var healthbar_y = panel_bottom - 2 - padding;
var hc = health_color;
if(entity.entity_health < 20) hc = c_red;
else if(entity.entity_health < 100) hc = c_yellow;
draw_healthbar(healthbar_x, healthbar_y, healthbar_x + need_bar_offset - padding, healthbar_y + 2, entity.entity_health, c_black, hc, hc, 0, true, true);

#endregion

#region need bars

var need_bar_top = panel_top + padding;
var need_bar_bottom = panel_bottom - padding;

var hbx = panel_left + need_bar_offset + need_bar_space; //name_x + other.ap_name_w - bw;

if(scr_instance_inherits(entity, obj_astronaut))
{
	// food_level bar
	draw_healthbar(hbx, need_bar_top, hbx + need_bar_width, need_bar_bottom, entity.food_level, c_black, food_color, food_color, 3, true, true);
	// sleep bar
	hbx = hbx + need_bar_width + need_bar_space;
	draw_healthbar(hbx, need_bar_top, hbx + need_bar_width, need_bar_bottom, entity.sleep_level, c_black, sleep_color, sleep_color, 3, true, true);
	// oxygen bar
	if(entity.wears_suit)
	{
		hbx = hbx + need_bar_width + need_bar_space;
		draw_healthbar(hbx, need_bar_top, hbx + need_bar_width, need_bar_bottom, entity.suit_oxygen, c_black, oxygen_color, oxygen_color, 3, true, true);
	}
}
else	// thing is robot, draw battery_charge
{
	draw_healthbar(hbx, need_bar_top, hbx + need_bar_width, need_bar_bottom, entity.battery_charge, c_black, charge_color, charge_color, 3, true, true);
}

#endregion

#region autotask icons

if(entity.object_index == obj_robot || scr_instance_inherits(entity, obj_astronaut))
{
	var icon_x = panel_left + icon_offset + icon_space;
	var icon_top = panel_top + padding;

	var c_attack = c_dkgray;
	if(entity.auto_attack) c_attack = c_aqua;
	draw_sprite_ext(spr_auto_attack_small, 2, icon_x, icon_top, 1, 1, 0, c_attack, 1);

	icon_x = icon_x + icon_width + icon_space;
	var c_construct = c_dkgray;
	if(entity.auto_construct) c_construct = c_aqua;
	draw_sprite_ext(spr_auto_construct_small, 2, icon_x, icon_top, 1, 1, 0, c_construct, 1);
}

if(scr_instance_inherits(entity, obj_astronaut))
{
	icon_x = icon_x + icon_width + icon_space;
	var c_sleep = c_dkgray;
	if(entity.auto_sleep) c_sleep = c_aqua;
	draw_sprite_ext(spr_auto_sleep_small, 2, icon_x, icon_top, 1, 1, 0, c_sleep, 1);
	
	icon_x = icon_x + icon_width + icon_space;
	var c_food = c_dkgray;
	if(entity.auto_eat) c_food = c_aqua;
	draw_sprite_ext(spr_auto_feed_small, 2, icon_x, icon_top, 1, 1, 0, c_food, 1);
}

#endregion