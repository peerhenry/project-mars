function scenario_register_scripts() {
	var container = init_register_scripts();
	script_container_register(container, "get_layer_for", scr_mock_get_layer_for);
	script_container_register(container, "play_sound", scr_mock);
	script_container_register(container, "play_sound_at", scr_mock_return_noone);
	script_container_register(container, "play_sound_at_ext", scr_mock_return_noone);
	script_container_register(container, "alert_player", scr_mock_alert);
	script_container_register(container, "create_explosion_and_rubble", scr_mock);
	return container;


}
