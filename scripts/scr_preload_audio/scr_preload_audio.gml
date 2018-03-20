/// @description Audio initializer called at boot only

var settings = global.settings;
var volume_master = settings[? key_settings_sound_volume_master];
var volume_voice = settings[? key_settings_sound_volume_voice];
var volume_sfx = settings[? key_settings_sound_volume_sfx];
var volume_music = settings[? key_settings_sound_volume_music];

// # load audio groups
audio_group_load(audiogroup_voice);
audio_group_load(audiogroup_sfx);
audio_group_load(audiogroup_music);

// Set volume levels
audio_master_gain(volume_master/100);
audio_group_set_gain(audiogroup_voice, volume_voice/100, 0);
audio_group_set_gain(audiogroup_sfx, volume_sfx/100, 0);
audio_group_set_gain(audiogroup_music, volume_music/100, 0);
global.music_volume = volume_voice;
global.sfx_volume = volume_sfx;
global.voice_volume = volume_music;