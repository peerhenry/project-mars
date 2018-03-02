var s = irandom(2);
switch s{
	case 0: audio_play_sound(sound_cmd_yes,1,false); break;
	case 1: audio_play_sound(sound_cmd_commands,1,false); break;
	case 2:	audio_play_sound(sound_cmd_orders,1,false);	break;
}