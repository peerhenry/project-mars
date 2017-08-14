/// @description Update oxygen levels

var all_hatches_closed = true;
var room_drainage_per_hatch = hatch_o2_drainage_for_one_tile / max(ds_list_size(tiles),1);

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
		oxygen_should_replenish = false; // do not replenish if hatch is open.
	}
	n++;
}

if(all_hatches_closed)
{
	// auto reset replenishment
	if(!oxygen_is_leaking)
	{
		oxygen_should_replenish = true;
	}
	
	// autp reset leakage flag
	if(!oxygen_should_replenish)
	{
		var no_door_leakage = true;
		var n = 0;
		var open_door_count = 0;
		repeat(ds_list_size(doors))
		{
			// if a door is open and the other room is leaking, then this room is leaking as well.
			next_door = ds_list_find_value(doors, n);
			if(next_door.is_open)
			{
				open_door_count++;
				if(next_door.room1 == id && next_door.room2 != id && next_door.room2.oxygen_is_leaking)
				{
					no_door_leakage = false;
					break;
				}
				else if(next_door.room1 != id && next_door.room2 == id && next_door.room1.oxygen_is_leaking)
				{
					no_door_leakage = false;
					break;
				}
			}
			n++;
		}
		oxygen_should_replenish = no_door_leakage;
		if(open_door_count == 0)
		{
			oxygen_is_leaking = false;
		}
	}
}

var current_consumption = scr_get_grid_prop(id, macro_grid_oxygen, macro_grid_prop_value);
var new_consumption = 0;
// replenish oxygen
if(oxygen_level < 100 && oxygen_should_replenish && scr_can_draw_from_grid(id, macro_grid_oxygen))
{
	var replenishment = min(100 - oxygen_level, o2_replenishment);
	new_consumption = replenishment*ds_list_size(tiles);
	oxygen_level += o2_replenishment;
}

if(current_consumption != new_consumption)
{
	scr_set_grid_prop(id, macro_grid_oxygen, macro_grid_prop_value, new_consumption);
}