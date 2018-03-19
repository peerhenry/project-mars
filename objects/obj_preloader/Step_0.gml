if(finished) exit; //wait for fader to transition to next room

if(all_loaded)
{
	scr_start(); // Start application main route
	finished = true;
	exit;
}

if(working) //check finished
{
	var audio_groups = [audiogroup_default, audiogroup_music, audiogroup_sfx, audiogroup_voice];
	var audio_groups_size = array_length_1d(audio_groups);
	var audio_groups_loaded = 0;
	for(var i = 0; i < audio_groups_size; i++)
	{
		if(audio_group_is_loaded(audio_groups[i])) audio_groups_loaded++; //audio loads asynchronously
	}
	
	if(audio_groups_loaded == audio_groups_size) all_loaded = true;
	
	if(all_loaded)
	{
		working = false;
		progress = 100;
		exit;
	}
	
	if(progress < 90)
	{
		progress = 10 + (audio_groups_loaded * (80 / audio_groups_size));
	}
	
	exit;
}

//start working
working = true;

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
global.last_level_index = 6;
global.mission_control_return_room = room_menu;
global.mission_is_active = false;