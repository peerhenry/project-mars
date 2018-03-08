event_inherited();

show_details = false;
hovering_over_details_panel = false;

alarm[1] = 30 + round(random_range(-5,5));

details_panel_width = 384;
details_panel_height = 32 + 16 + 24*5 + 64*3 + 96; // padding + spaces + lines + inventory + avatar

oxygen_bar_color = global.oxygen_bar_color;
food_bar_color= global.food_bar_color;
sleep_bar_color = global.sleep_bar_color;
health_bar_color = global.health_bar_color;

#region details panel settings

width = details_panel_width;
height = details_panel_height;
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
tl_x = 0;
tl_y = gui_height - height;

#endregion