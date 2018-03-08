hover = false;
entity = noone;

top = 0;
left = 0;
right = 0;

// need colors
health_color = global.health_bar_color;
oxygen_color = global.oxygen_bar_color;
sleep_color = global.sleep_bar_color;
food_color = global.food_bar_color;
charge_color = c_yellow;

panel_height = 28;
margin = 20;
padding = 4;
panel_spacing = 4; // y space between panels

need_bar_offset = 122; // x offset where need bars begin
need_bar_width = 3;
need_bar_space = 5;

icon_offset = need_bar_offset + 3*(need_bar_width + need_bar_space);
icon_width = 16;
icon_space = 4;

panel_width = icon_offset + 4*(icon_width + icon_space) + padding;
// 122 + 3*(3 + 5) + 4*(16 + 4) + 4 = 230