ini_open(macro_settings_file);

var ini_volume_master = ini_read_real("sound", "master", macro_master_default);
var ini_volume_voice = ini_read_real("sound", "voice", macro_voice_default);
var ini_volume_sfx = ini_read_real("sound", "sfx", macro_sfx_default);
var ini_volume_music = ini_read_real("sound", "music", macro_music_default);

var volume_master = round(audio_get_master_gain(0)*100);
var volume_voice = global.voice_volume;
var volume_sfx = global.sfx_volume;
var volume_music = global.music_volume;

if(volume_master != ini_volume_master)
{
	ini_write_real("sound", "voice", volume_master);
}
if(volume_voice != ini_volume_voice)
{
	ini_write_real("sound", "voice", volume_voice);
}
if(volume_sfx != ini_volume_sfx)
{
	ini_write_real("sound", "sfx", volume_sfx);
}
if(volume_music != ini_volume_music)
{
	ini_write_real("sound", "music", volume_music);
}
ini_close();