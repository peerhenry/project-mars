text = "";
popping_up = true;
popping_down = false;
alarm[0] = 30*3; // 3 seconds
font = font_hud;
#macro msg_padding 8
message_height = font_get_size(font) + 2*msg_padding;
half_height = message_height/2;
gui_height = display_get_gui_height();
text_x = display_get_gui_width()/2;
text_y = gui_height + half_height;
text_stop_y = gui_height - half_height;

if( !audio_is_playing(sound_fx_notify) ) audio_play_sound(sound_fx_notify, 0, 0);