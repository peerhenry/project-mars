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
scr_preload_game_globals();