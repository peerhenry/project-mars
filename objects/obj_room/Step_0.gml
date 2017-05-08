/// @description Update oxygen levels

var all_hatches_closed = true;
var room_drainage_per_hatch = hatch_o2_drainage_for_one_tile / ds_list_size(tiles);

var next_hatch = undefined;
var n = 0;
repeat(ds_list_size(hatches)){
	next_hatch = ds_list_find_value(hatches, n);
	if(!is_undefined(next_hatch)){
		if(next_hatch.is_open){
			if(oxygen_level > 0)
			{
				oxygen_level -= room_drainage_per_hatch; // each open hatch contributes to leakage.
				if(oxygen_level < 0) oxygen_level  = 0;
			}
			all_hatches_closed = false;
			oxygen_is_replenishing = false; // do not replenish if hatch is open.
		}
	}
	n++;
}

if(all_hatches_closed) oxygen_is_replenishing = true;

if(oxygen_level < 100 && oxygen_is_replenishing) // replenish oxygen
{
	oxygen_level += o2_replenishment;
}