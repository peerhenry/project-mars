if(under_construction) exit;

event_inherited();

if(is_open){
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
				room2.oxygen_level -= global.gate_drainage_speed/max(size2,1);
			}
			else if(room2.oxygen_is_leaking && o2 < global.oxygen_empty_level )
			{
				// pure drainage on room 1
				room1.oxygen_level -= global.gate_drainage_speed/max(size1,1);
			}
			else{
				// oxygen distribution
				var flux = (global.gate_drainage_speed * level_diff)/100;
				var do1 = -flux/max(size1,1);
				var do2 = flux/max(size2,1);
				room1.oxygen_level += do1;
				room2.oxygen_level += do2;
			}
			
			if(room2.oxygen_is_leaking){
				room1.oxygen_is_leaking = true;
			}
			else if(room1.oxygen_is_leaking){
				room2.oxygen_is_leaking = true;
			}
		
			// clamp new values
			if(room1.oxygen_level > 100) room1.oxygen_level = 100;
			else if(room1.oxygen_level < 0) room1.oxygen_level = 0;
			if(room2.oxygen_level > 100) room2.oxygen_level = 100;
			else if(room2.oxygen_level < 0) room2.oxygen_level = 0;
		}
	}
}