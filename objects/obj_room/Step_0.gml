/// @description Update oxygen levels

//var all_hatches_closed = true;
var room_drainage_per_hatch = hatch_o2_drainage_for_one_tile / max(ds_list_size(tiles),1);

var next_hatch = undefined;
for(var n = 0; n < ds_list_size(hatches); n++)
{
	next_hatch = ds_list_find_value(hatches, n);
	if(next_hatch.is_open)
	{
		if(oxygen_level > 0)
		{
			oxygen_level -= room_drainage_per_hatch; // each open hatch contributes to leakage.
			if(oxygen_level < 0) oxygen_level  = 0;
		}
		//all_hatches_closed = false;
		oxygen_is_leaking = true;
		//oxygen_should_replenish = false; // do not replenish if hatch is open.
	}
	n++;
}

var leak_count = ds_list_size(leaks);
if(leak_count > 0) oxygen_is_leaking = true;
for(var n = 0; n < leak_count; n++)
{
	var next_leak = ds_list_find_value(leaks, n);
	if(oxygen_level > 0)
	{
		oxygen_level -= room_drainage_per_hatch; // todo: set leak specific drainage
		if(oxygen_level < 0) oxygen_level  = 0;
	}
}

if(oxygen_is_leaking)
{
	scr_set_grid_prop(id, macro_grid_oxygen, macro_grid_prop_can_perform_role, false);
}
else scr_set_grid_prop(id, macro_grid_oxygen, macro_grid_prop_can_perform_role, true);

var current_consumption = scr_get_grid_prop(id, macro_grid_oxygen, macro_grid_prop_value);
var new_consumption = 0;
// replenish oxygen
if(oxygen_level < 100 && !oxygen_is_leaking && scr_can_draw_from_grid(id, macro_grid_oxygen))
{
	var replenishment = min(100 - oxygen_level, o2_replenishment);
	new_consumption = replenishment*ds_list_size(tiles);
	oxygen_level += o2_replenishment;
	if(oxygen_level > 100) oxygen_level = 100;
}

if(current_consumption != new_consumption)
{
	scr_set_grid_prop(id, macro_grid_oxygen, macro_grid_prop_value, new_consumption);
}