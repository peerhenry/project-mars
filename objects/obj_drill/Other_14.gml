/// @description Post Init
show_debug_message("drill post init"); // DEBUG
event_inherited();
scr_drill_pump_connection(id);
event_user(macro_event_drill_mine_check);