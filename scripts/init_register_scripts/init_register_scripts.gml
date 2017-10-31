var container = script_container_create();
script_container_register(container, "room_logic_basetile", scr_room_logic_basetile);
script_container_register(container, "play_sound", scr_play_sound);
script_container_register(container, "get_layer_for", scr_get_layer_for);
script_container_register(container, "alert_player", scr_alert_player);
global.script_container = container;