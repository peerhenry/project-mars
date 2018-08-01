/// @arg sound
/// @arg x
/// @arg y
/// @arg should_loop
var arg_sound = argument0;
var arg_x = argument1;
var arg_y = argument2;
var arg_should_loop = argument3;

audio_falloff_set_model(audio_falloff_linear_distance_clamped);
// audio_falloff_set_model(audio_falloff_exponent_distance_clamped);

var snd = audio_play_sound_at(
	arg_sound, 
	arg_x, 
	arg_y, 
	0,					// z
	300,				// falloff reference	: "the distance under which the volume for the source would normally drop by half"
	3000,				// falloff max			: "the distance where there will no longer be any attenuation of the source sound"
	0.99,				// falloff factor
	arg_should_loop,	// loop
	1					// priority
);

audio_sound_gain(snd, 0.2, 0);

return snd;