/// @description Parent level for campaign levels
event_inherited();
global.mission_accomplished_return_room = mission_control;
global.mission_failed_return_room = room_menu;
if(global.next_level == global.last_level_index) global.mission_accomplished_return_room = room_credits;
site = global.mission_control_site;
global.mission_is_active = true;