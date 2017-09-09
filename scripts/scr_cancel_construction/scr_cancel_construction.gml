/// @param construction
scr_trace("Canceling construction");
debug_type(argument0, macro_type_map);
var arg_construction = argument0;

// Replace MDU piles
var piles = arg_construction[? construction_mdu_piles];
for(var n = 0; n < ds_list_size(piles); n++)
{
	var next_pile = ds_list_find_value(piles, n);
	var mdu_pile = instance_create_layer(next_pile.x, next_pile.y, macro_base_tall_layer, obj_mdu_pile);
	mdu_pile.image_index = next_pile.image_index;
	mdu_pile.mdu_count = next_pile.image_index;
}

scr_destroy_construction(arg_construction);