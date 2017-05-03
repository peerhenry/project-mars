var i = argument0;
var j = argument1;

var isfree = mp_grid_get_cell(global.grid_map, i, j) == 0;
if(isfree){
	
	// if tile contains wall, remove wall
	
	var targetX = (i+1)*32;
	var targetY = (j+1)*32;
		
	var blid = layer_get_id("base");
	instance_create_layer(targetX, targetY, blid, obj_base_tile);
	
	// the other one is instance_place
	var wall_id = instance_position(targetX, targetY, obj_wall);
	while(wall_id != noone)
	{
		with(wall_id) instance_destroy();
		wall_id = instance_position(targetX, targetY, obj_wall);
	}

	// add walls around tile	
	scr_add_wall(i-1, j-1, 0);	// NW
	scr_add_wall(i, j-1, 1);	// N
	scr_add_wall(i+1, j-1, 2);	// NE
	
	scr_add_wall(i-1, j, 3);	// W
	scr_add_wall(i+1, j, 4);	// E
	
	scr_add_wall(i-1, j+1, 5);	// SW
	scr_add_wall(i, j+1, 6);	// S
	scr_add_wall(i+1, j+1, 7);	// SE
	
	
	var s = irandom(4);
	switch s{
		case 0: audio_play_sound(sound_fx_build_1,1,false); break;
		case 1: audio_play_sound(sound_fx_build_2,1,false); break;
		case 2:	audio_play_sound(sound_fx_build_3,1,false);	break;
		case 3:	audio_play_sound(sound_fx_build_4,1,false);	break;
		case 4:	audio_play_sound(sound_fx_build_5,1,false);	break;
	}
}