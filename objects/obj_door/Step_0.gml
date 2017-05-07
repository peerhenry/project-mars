/// @description Insert description here
// You can write your code in this editor
if(image_index == target_frame){
	image_speed = 0;
}

if(is_open){
	if(auto_close){
		var astronaut = collision_rectangle(x-15, y-15, x+15, y+15, obj_character, false, true);
		if(astronaut == noone)	scr_door_toggle();	
	}
} else {
	if(!locked){
		var astronaut = collision_rectangle(x-15, y-15, x+15, y+15, obj_character, false, true);
		if(astronaut != noone){
			scr_door_toggle();
		}	
	}
}