if( instance_number(object_index) > 1 ) show_error("more than one: " + string( object_get_name(object_index) ), true);
audio_stop_sound(song_menu);
global.music_is_playing = !global.dev_env;
index = -1; // song starts at 0
global.current_song = -1;

songs[8] = song_tim_1; // atmospheric spacy song
songs[7] = song_sinkhole;
songs[6] = song_signals;
songs[5] = song_tim_2; // dark d&b song
songs[4] = song_vistas;
songs[3] = song_claim;
songs[2] = song_dig;
songs[1] = song_explore;
songs[0] = song_work;