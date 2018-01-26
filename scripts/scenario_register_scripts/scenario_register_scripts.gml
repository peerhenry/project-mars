var container = init_register_scripts();
script_container_register(container, "get_layer_for", scr_mock_get_layer_for);
script_container_register(container, "play_sound", scr_mock);
script_container_register(container, "alert_player", scr_mock_alert);
return container;