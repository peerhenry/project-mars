/// @arg script_container
/// @arg construction
var arg_script_container = argument0;
var arg_construction = argument1;

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
	}
}
else
{
	// Create new pile in center of construction
	var cx = (arg_construction[? construction_bb_left] + arg_construction[? construction_bb_right])/2;
	var cy = (arg_construction[? construction_bb_top] + arg_construction[? construction_bb_bottom])/2;
	var get_layer_for = script_container_resolve(arg_script_container, "get_layer_for");
	var lyr = script_execute(get_layer_for, obj_construction_mdu_pile);
	var clamped_cx = scr_rc_clamp_center(cx);
	var clamped_cy = scr_rc_clamp_center(cy);
	var newpile = instance_create_layer(clamped_cx, clamped_cy, lyr, obj_construction_mdu_pile);
	//ds_map_replace(arg_construction, construction_mdu_pile, newpile);
	ds_list_add(piles, newpile);
}

if(remaining_mdus == 0)
{
	ds_map_replace(arg_construction, construction_build_state, construction_state.ready);
}