if(finished)
{
    instance_destroy();
	scr_start(); // Start application main route
	exit;
}

if(working) //check finished
{
	var all_finished = true;
	var check_groups = [audiogroup_default, audiogroup_music, audiogroup_sfx, audiogroup_voice];
	for(var i = 0; i < array_length_1d(all_finished); i++)
	{
		if(!audio_group_is_loaded(check_groups[i]))
		{
			all_finished = false;
			break;
		}
	}
	if(all_finished)
	{
		scr_force_trace("Preloader finished");
		finished = true;
	}
	exit;
}

//start working
working = true;

// Load audio and set levels
init_audio();

// Misc
		
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