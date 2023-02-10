function test_register_scripts() {
	var container = script_container_create();
	script_container_register(container, "room_logic_basetile", scr_mock);
	script_container_register(container, "play_sound", scr_mock_return_noone);
	script_container_register(container, "play_sound_at", scr_mock_return_noone);
	script_container_register(container, "play_sound_at_ext", scr_mock_return_noone);
	script_container_register(container, "get_layer_for", scr_mock_get_layer_for);
	script_container_register(container, "alert_player", scr_mock_alert);
	script_container_register(container, "calculate_required_mdu_count", scr_mock_return_0);
	script_container_register(container, "create_instance", scr_mock_return_noone);
	script_container_register(container, "create_corpse", scr_mock);
	script_container_register(container, "get_reach_state", scr_mock_return_true);
	script_container_register(container, "room_logic_door", scr_mock);
	script_container_register(container, "door_destroy_logic", scr_mock);
	script_container_register(container, "create_explosion_and_rubble", scr_mock);
	script_container_register(container, "room_remove_tile_and_part", scr_room_remove_tile_and_part); // todo: move construction tests to scenario tests
	script_container_register(container, "init_gui", scr_mock);
	script_container_register(container, "can_draw_power", scr_mock_return_true);
	return container;


}
