/// @param script_container
/// @param construction
scr_trace("Canceling construction");
var arg_container = argument0;
var arg_construction = argument1;
debug_type(arg_construction, macro_type_map);

// Replace MDU piles
var piles = arg_construction[? construction_mdu_piles];
for(var n = 0; n < ds_list_size(piles); n++)
{
	var next_pile = ds_list_find_value(piles, n);
	var get_layer_for = script_container_resolve(arg_container, "get_layer_for");
	var lyr = script_execute(get_layer_for, obj_mdu_pile);
	var px = scr_rc_clamp_center(next_pile.x);
	var py = scr_rc_clamp_center(next_pile.y);
	var mdu_pile = instance_create_layer(px, py, lyr, obj_mdu_pile);
	mdu_pile.image_index = next_pile.image_index;
	mdu_pile.mdu_count = next_pile.image_index+1;
	scr_finalize(mdu_pile);
}

scr_destroy_construction(arg_construction);