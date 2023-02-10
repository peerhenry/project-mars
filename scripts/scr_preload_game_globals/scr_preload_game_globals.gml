/// @description Preload game globals (called by obj_preloader)
function scr_preload_game_globals() {

	// Load audio (async) and set levels
	scr_preload_audio();

	// -- Misc game content related loading --
	global.room_is_transitioning = false;

	// Skirmish/level settings
	var skirmish_settings = ds_map_create();
	ds_map_add(skirmish_settings, macro_skirmish_victory_condition, victory.domination);
	ds_map_add(skirmish_settings, macro_skirmish_astro_count, 5);
	ds_map_add(skirmish_settings, macro_skirmish_mdu_pile_count, 4);

	global.skirmish_settings = skirmish_settings;
	global.level_object_index = noone;
	global.mission_accomplished_return_room = room_menu;
	global.mission_failed_return_room = room_menu;
	global.mission_control_site = noone; // used to flag when mission accomplished
	global.next_level = 1;
	global.last_level_index = 6; // todo: refactor to end_level_index to avoid confusion
	global.mission_control_return_room = room_menu;
	global.mission_is_active = false;


}
