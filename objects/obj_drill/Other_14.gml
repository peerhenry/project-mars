/// @description Post Init
show_debug_message("drill post init"); // DEBUG
event_inherited();
scr_drill_pump_connection(id);
scr_connect_drill_to_buckets(id);