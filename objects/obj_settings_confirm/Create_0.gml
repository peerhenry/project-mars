countdown = 10; //seconds

var spacing = 16;

button_yes = instance_create_depth(0, 3/6 * room_height, 0, obj_button);
button_yes.text = "Yes";
button_yes.x = room_width/2 - spacing/2 - sprite_get_width(button_yes.sprite_index)/2;
button_yes.click_action = scr_menu_settings_confirm_yes;

button_no = instance_create_depth(0, 3/6 * room_height, 0, obj_button);
button_no.text = "No";
button_no.x = room_width/2 + spacing/2 + sprite_get_width(button_no.sprite_index)/2;
button_no.click_action = scr_menu_settings_confirm_no;

alarm[0] = 1; //start countdown