event_inherited();

show_details = false;
hovering_over_details_panel = false;

alarm[1] = 30 + round(random_range(-5,5));

details_panel_width = 384;
details_panel_height = 32 + 16 + 24*5 + 64*3 + 96; // padding + spaces + lines + inventory + avatar
ap_offset = 0;
with(obj_HUD) other.ap_offset = ap_w + ap_margin;

oxygen_bar_color = global.oxygen_bar_color;
food_bar_color= global.food_bar_color;
sleep_bar_color = global.sleep_bar_color;
health_bar_color = global.health_bar_color;