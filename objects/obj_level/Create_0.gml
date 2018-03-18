global.mission_accomplished_return_room = room_menu;
global.mission_failed_return_room = room_menu;
alarm[0] = 1;
trigger_list = ds_list_create();

// Always make sure these macros correspond to the proper user events
#macro macro_victory_callback 0
#macro macro_defeat_callback 1

// Triggers will always make a callback to level, usage is optional
#macro macro_trigger_callback 2
#macro macro_else_callback 3