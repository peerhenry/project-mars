/// @param astronaut
var arg_astronaut = argument0;

var constr_queue = scr_get_construction_queue(arg_astronaut);
if(constr_queue == noone) exit;

var construction_count = ds_list_size(constr_queue);
for(var n = 0; n < construction_count; n++)
{
	// Check if construction has a prerequisite construction
	var next_construction = ds_list_find_value(constr_queue, n);
	var build_state = ds_map_find_value(next_construction, construction_build_state);
	var prerequisite = ds_map_find_value(next_construction, construction_prerequisite);
	
	// The prerequisite must either be gone or done in order for this one to be picked up
	var pass_from_prerequisite = true;
	if(ds_exists(prerequisite, ds_type_map))
	{
		pass_from_prerequisite = ds_map_find_value(prerequisite, construction_build_state) == construction_state.done;
	}
	
	if(pass_from_prerequisite)
	{
		if(build_state == construction_state.ready)
		{
			var picked_up = scr_try_to_pick_up_construction(arg_astronaut, next_construction);
			if(picked_up) break;
		}
		else	// Not ready to be picked up; needs MDU's
		{
			if(scr_inventory_has_item(arg_astronaut.inventory, macro_item_mdu))
			{
				// Only try to deliver mdu to construction if current deliveries do not satisfy required mdu count.
				var deliveries = ds_map_find_value(next_construction, construction_mdu_deliveries);
				var required = ds_map_find_value(next_construction, construction_required_mdu_remaining);
				if(required > deliveries) scr_try_to_deliver_mdu(arg_astronaut, next_construction);
			}
		}
	}
}