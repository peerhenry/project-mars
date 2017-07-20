// Set resolution
ini_open("game_settings.ini");
var width = ini_read_real("settings", "width", 1920);
var height = ini_read_real("settings", "height", 1080);
ini_close();
scr_resolution(width, height);

// audio_play_sound(song_menu,1,false);
cursor_sprite = spr_cursor;
global.room_is_transitioning = false;