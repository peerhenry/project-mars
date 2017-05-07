var constructed = false;

switch(argument0){
	case global.basetile:
		constructed = scr_construct_basetile(mouse_x, mouse_y);
		break;
	case global.wall:
		constructed = scr_construct_wall(mouse_x, mouse_y);
		break;
	case global.door:
		constructed = scr_construct_door(mouse_x, mouse_y);
		break;
	case global.hatch:
		constructed = scr_construct_hatch(mouse_x, mouse_y);
		break;
}

if(constructed)
{
	var s = irandom(4);
	switch s{
		case 0: audio_play_sound(sound_fx_build_1, 1, false); break;
		case 1: audio_play_sound(sound_fx_build_2, 1, false); break;
		case 2:	audio_play_sound(sound_fx_build_3, 1, false); break;
		case 3:	audio_play_sound(sound_fx_build_4, 1, false); break;
		case 4:	audio_play_sound(sound_fx_build_5, 1, false); break;
	}
}