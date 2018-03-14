var skirmish_settings = global.skirmish_settings;
victory_contition = skirmish_settings[? macro_skirmish_victory_condition];
game_over = false;
global.mission_accomplished_return_room = room_menu;
global.mission_failed_return_room = room_menu;
alarm[0] = 1;