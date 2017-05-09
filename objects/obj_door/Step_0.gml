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
	
	// transfer oxygen
	if(room1 != noone && room2 != noone && room1.oxygen_level != room2.oxygen_level)
	{
		var o1 = room1.oxygen_level;
		var o2 = room2.oxygen_level;
		var level_diff = o1 - o2;
		if(abs(level_diff) > 0.1)
		{
			var size1 = ds_list_size(room1.tiles);
			var size2 = ds_list_size(room2.tiles);
			
			if(room1.oxygen_is_leaking && o1 < global.oxygen_empty_level )
			{
				// pure drainage on room 2
				room2.oxygen_level -= global.gate_drainage_speed/size2;
			}
			else if(room2.oxygen_is_leaking && o2 < global.oxygen_empty_level )
			{
				// pure drainage on room 1
				room1.oxygen_level -= global.gate_drainage_speed/size1;
			}
			else{
				// oxygen distribution
				var flux = (global.gate_drainage_speed * level_diff)/100;
				var do1 = -flux/size1;
				var do2 = flux/size2;
				room1.oxygen_level += do1;
				room2.oxygen_level += do2;
			}
			
			if(room2.oxygen_is_leaking){
				room1.oxygen_is_leaking = true;
				room1.oxygen_is_replenishing = false;
			}
			else if(room1.oxygen_is_leaking){
				room2.oxygen_is_leaking = true;
				room2.oxygen_is_replenishing = false;
			}
		
			// clamp new values
			if(room1.oxygen_level > 100) room1.oxygen_level = 100;
			else if(room1.oxygen_level < 0) room1.oxygen_level = 0;
			if(room2.oxygen_level > 100) room2.oxygen_level = 100;
			else if(room2.oxygen_level < 0) room2.oxygen_level = 0;
		}
	}
	
} else {
	if(!locked){
		var astronaut = collision_rectangle(x-15, y-15, x+15, y+15, obj_character, false, true);
		if(astronaut != noone){
			scr_door_toggle();
		}	
	}
}