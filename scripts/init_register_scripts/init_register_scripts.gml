var container = script_container_create();
script_container_register(container, "room_logic_basetile", scr_room_logic_basetile);
script_container_register(container, "play_sound", scr_play_sound);
global.script_container = container;