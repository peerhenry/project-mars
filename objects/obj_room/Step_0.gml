/// @description Update oxygen levels

var all_hatches_closed = true;
var room_drainage_per_hatch = hatch_o2_drainage_for_one_tile / ds_list_size(tiles);

var next_hatch = undefined;
var n = 0;
repeat(ds_list_size(hatches))
{
	next_hatch = ds_list_find_value(hatches, n);
	if(next_hatch.is_open)
	{
		if(oxygen_level > 0)
		{
			oxygen_level -= room_drainage_per_hatch; // each open hatch contributes to leakage.
			if(oxygen_level < 0) oxygen_level  = 0;
		}
		all_hatches_closed = false;
		oxygen_is_leaking = true;
		oxygen_is_replenishing = false; // do not replenish if hatch is open.
	}
	n++;
}

if(all_hatches_closed)
{
	// auto reset replenishment
	if(!oxygen_is_leaking)
	{
		oxygen_is_replenishing = true;
	}
	
	// autp reset leakage flag
	if(!oxygen_is_replenishing)
	{
		var no_door_leakage = true;
		var n = 0;
		repeat(ds_list_size(doors)){
			// if a door is open and the other room is leaking, then this room is leaking as well.
			next_door = ds_list_find_value(doors, n);
			if(next_door.is_open){
				if(next_door.room1 == id && next_door.room2 != id && next_door.room2.oxygen_is_leaking){
					no_door_leakage = false;
					break;
				}
				else if(next_door.room1 != id && next_door.room2 == id && next_door.room1.oxygen_is_leaking){
					no_door_leakage = false;
					break;
				}
			}
			n++;
		}
		oxygen_is_replenishing = no_door_leakage;
	}
}

// replenish oxygen
if(oxygen_level < 100 && oxygen_is_replenishing)
{
	oxygen_level += o2_replenishment;
}