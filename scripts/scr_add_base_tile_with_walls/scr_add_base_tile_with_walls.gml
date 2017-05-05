var i = argument0;
var j = argument1;
var play_sound = false; // argument?

var target_x = scr_gi_to_rc(i);
var target_y = scr_gi_to_rc(j);

// either grid is free and there is no base tile, or its a wall
var thunderbirds_are_go = false;

grid_is_free = mp_grid_get_cell(global.grid_map, i, j) == 0;

var existing_base_tile = instance_position(target_x, target_y, obj_base_tile);
if(grid_is_free && existing_base_tile == noone)
{
	thunderbirds_are_go = true;
}
else{
	var wall_id = instance_position(target_x, target_y, obj_wall);
	if((wall_id != noone))
	{
		with(wall_id) instance_destroy();
		if(existing_base_tile != noone)
		{
			with(existing_base_tile) instance_destroy();
		}
		thunderbirds_are_go = true;
	}
}

if(thunderbirds_are_go){
	
	// if tile contains wall, remove wall
		
	var blid = layer_get_id("base");
	instance_create_layer(target_x, target_y, blid, obj_base_tile);

	// add walls around tile
	walls[0] = scr_add_outside_wall(i-1, j-1);	// NW
	walls[1] = scr_add_outside_wall(i, j-1);	// N
	walls[2] = scr_add_outside_wall(i+1, j-1);	// NE
	
	walls[3] = scr_add_outside_wall(i-1, j);	// W
	walls[4] = scr_add_outside_wall(i+1, j);	// E
	
	walls[5] = scr_add_outside_wall(i-1, j+1);	// SW
	walls[6] = scr_add_outside_wall(i, j+1);	// S
	walls[7] = scr_add_outside_wall(i+1, j+1);	// SE
	
	// extra walls to update
	walls[8] = instance_position(target_x+64, target_y+32, obj_wall);
	walls[9] = instance_position(target_x+64, target_y, obj_wall);
	walls[10] = instance_position(target_x+64, target_y-32, obj_wall);
	walls[11] = instance_position(target_x-64, target_y+32, obj_wall);
	walls[12] = instance_position(target_x-64, target_y, obj_wall);
	walls[13] = instance_position(target_x-64, target_y-32, obj_wall);
	
	walls[14] = instance_position(target_x+32, target_y+64, obj_wall);
	walls[15] = instance_position(target_x, target_y+64, obj_wall);
	walls[16] = instance_position(target_x-32, target_y+64, obj_wall);
	walls[17] = instance_position(target_x+32, target_y-64, obj_wall);
	walls[18] = instance_position(target_x, target_y-64, obj_wall);
	walls[19] = instance_position(target_x-32, target_y-64, obj_wall);
	
	for(s=0; s<20; s++)
	{
		if(walls[s] != noone) scr_wall_update_state(walls[s]);
	}
	
	if(play_sound)
	{
		var s = irandom(4);
		switch s{
			case 0: audio_play_sound(sound_fx_build_1,1,false); break;
			case 1: audio_play_sound(sound_fx_build_2,1,false); break;
			case 2:	audio_play_sound(sound_fx_build_3,1,false);	break;
			case 3:	audio_play_sound(sound_fx_build_4,1,false);	break;
			case 4:	audio_play_sound(sound_fx_build_5,1,false);	break;
		}
	}
}