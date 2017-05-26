audio_stop_sound(song_menu);
global.music_is_playing = false;
index = -1; // song starts at 0
global.current_song = -1;

songs[4] = song_jobs;
songs[3] = song_claim;
songs[2] = song_dig;
songs[1] = song_explore;
songs[0] = song_work;