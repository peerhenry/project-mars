/// @arg sound
/// @arg x
/// @arg y
/// @arg should_loop
/// @arg falloff_reference
/// @arg falloff_max
/// @arg falloff_factor
/// @arg gain
function scr_play_sound_at_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	var arg_sound = argument0;
	var arg_x = argument1;
	var arg_y = argument2;
	var arg_should_loop = argument3;
	var arg_ref = argument4;
	var arg_max = argument5;
	var arg_factor = argument6;
	var arg_gain = argument7;

	audio_falloff_set_model(audio_falloff_linear_distance_clamped);
	// audio_falloff_set_model(audio_falloff_exponent_distance_clamped);

	var snd = audio_play_sound_at(
		arg_sound, 
		arg_x, 
		arg_y, 
		0,					// z
		arg_ref,			// falloff reference	: "the distance under which the volume for the source would normally drop by half"
		arg_max,			// falloff max			: "the distance where there will no longer be any attenuation of the source sound"
		arg_factor,			// falloff factor
		arg_should_loop,	// loop
		1					// priority
	);

	audio_sound_gain(snd, arg_gain, 0);

	return snd;


}
