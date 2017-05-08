/// call specifix construction script, call room logic, play sound

var construct_type = argument0;
var new_instance = noone;

switch(construct_type){
	case global.basetile:
		new_instance = scr_construct_basetile(mouse_x, mouse_y);
		break;
	case global.wall:
		new_instance = scr_construct_wall(mouse_x, mouse_y);
		break;
	case global.door:
		new_instance = scr_construct_gate(mouse_x, mouse_y, global.door);
		break;
	case global.hatch:
		new_instance = scr_construct_gate(mouse_x, mouse_y, global.hatch);
		break;
}

if(new_instance != noone)
{
	scr_room_logic(construct_type, new_instance);
	var s = irandom(4);
	switch s{
		case 0: audio_play_sound(sound_fx_build_1, 1, false); break;
		case 1: audio_play_sound(sound_fx_build_2, 1, false); break;
		case 2:	audio_play_sound(sound_fx_build_3, 1, false); break;
		case 3:	audio_play_sound(sound_fx_build_4, 1, false); break;
		case 4:	audio_play_sound(sound_fx_build_5, 1, false); break;
	}
}