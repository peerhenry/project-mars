if( instance_number(object_index) > 1 ) instance_destroy();

oxygen_bar_color = global.oxygen_bar_color;
food_bar_color= global.food_bar_color;
sleep_bar_color = global.sleep_bar_color;
health_bar_color = global.health_bar_color;

width = 384;
height = 574; // 32 + 16 + 24*5 + 64*3 + 96 + 118; // padding + spaces + lines + inventory + avatar + (extra height needed to fit fridge)
top = display_get_gui_height() - height;
left = 0;
right = left + width;
bottom = top + height;
padding = 16;

unit = noone;
hover = false;
hover_inventory = false;

inventory_x = 0;
inventory_y = 0;
inventory_w = 0;
inventory_h = 0;