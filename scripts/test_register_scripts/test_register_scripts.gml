var container = script_container_create();
script_container_register(container, "room_logic_basetile", scr_mock);
script_container_register(container, "play_sound", scr_mock);
script_container_register(container, "get_layer_for", scr_mock_get_layer_for);
return container;