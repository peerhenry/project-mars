/// @description Give mdu to construction
/// @param astronaut
/// @param construction
var arg_astronaut = argument0;
var arg_construction = argument1;

scr_inventory_extract(arg_astronaut.inventory, macro_item_mdu);

var remaining_mdus = arg_construction[? construction_required_mdu_remaining] - 1;
ds_map_replace(arg_construction, construction_required_mdu_remaining, remaining_mdus);

// Add mdu to pile
var piles = arg_construction[? construction_mdu_piles];
var size = ds_list_size(piles);
if(size > 0)
{
	var last_pile = ds_list_find_value(piles, size-1);
	if(last_pile.image_index < 7) last_pile.image_index++;
	else	// add another pile
	{
		var segment = ceil((sqrt(1+4*size)-1)/2);	
		var x_s = size - (segment - 1)*segment;// pile number relative to segment;
		
		var dx = 32;
		var dy = 32;
		
		if(segment % 2 == 0)
		{
			if(x_s <= segment)
			{
				// right arrow
				dx = 32;
				dy = 0;
			}
			else
			{
				// down arrow
				dx = 0;
				dy = 32;
			}
		}
		else
		{
			if(x_s <= segment)
			{
				// left arrow
				dx = -32;
				dy = 0;
			}
			else
			{
				// up arrow
				dx = 0;
				dy = -32;
			}
		}
		var newpile = instance_create_layer(last_pile.x + dx, last_pile.y + dy, macro_base_layer, obj_construction_mdu_pile);
		ds_list_add(piles, newpile);
		
		/* DEBUG
		var msg = "new pile, segment: " + string(segment) + " x_s:" + string(x_s) + " dx:" + string(dx) + " dy:" + string(dy);
		show_debug_message(msg);
		scr_alert_player(msg);
		*/
	}
}
else
{
	// Create new pile in center of construction
	var cx = (arg_construction[? construction_bb_left] + arg_construction[? construction_bb_right])/2;
	var cy = (arg_construction[? construction_bb_top] + arg_construction[? construction_bb_bottom])/2;
	var newpile = instance_create_layer(cx, cy, macro_base_layer, obj_construction_mdu_pile);
	//ds_map_replace(arg_construction, construction_mdu_pile, newpile);
	ds_list_add(piles, newpile);
}

if(remaining_mdus == 0)
{
	ds_map_replace(arg_construction, construction_build_state, construction_state.ready);
}

if(arg_astronaut.current_action == astronaut_action.delivering_mdu)
{
	// decrement deliveries
	var deliveries_decr = arg_construction[? construction_mdu_deliveries] - 1;
	ds_map_replace(arg_construction, construction_mdu_deliveries, deliveries_decr);
	
	// set astronaut to idle
	arg_astronaut.current_action = astronaut_action.idle;
}


// DEBUG
scr_alert_player("Transfered MDU to construction, remaining: " + string(remaining_mdus));
show_debug_message("remaining_mdus" + string(remaining_mdus));
show_debug_message("remaining required MDUs in map: " + string(ds_map_find_value(arg_construction, construction_required_mdu_remaining)));
debug_show_construction(arg_construction);
