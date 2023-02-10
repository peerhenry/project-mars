function init_register_scripts() {
	scr_trace("init_register_scripts");
	var container = script_container_create();
	script_container_register(container, "room_logic_basetile", scr_room_logic_basetile);
	script_container_register(container, "play_sound", scr_play_sound);
	script_container_register(container, "play_sound_at", scr_play_sound_at);
	script_container_register(container, "play_sound_at_ext", scr_play_sound_at_ext);
	script_container_register(container, "get_layer_for", scr_get_layer_for);
	script_container_register(container, "alert_player", scr_alert_player);
	script_container_register(container, "calculate_required_mdu_count", scr_calculate_required_mdu_count);
	script_container_register(container, "create_instance", scr_create_instance);
	script_container_register(container, "create_corpse", scr_create_corpse);
	script_container_register(container, "get_reach_state", scr_get_reach_state);
	script_container_register(container, "room_logic_door", scr_room_logic_door);
	script_container_register(container, "door_destroy_logic", scr_door_destroy_logic);
	script_container_register(container, "create_explosion_and_rubble", scr_create_explosion_and_rubble);
	script_container_register(container, "room_remove_tile_and_part", scr_room_remove_tile_and_part);
	script_container_register(container, "init_gui", init_gui);
	script_container_register(container, "can_draw_power", scr_can_draw_power);
	global.script_container = container;
	return container;


}
