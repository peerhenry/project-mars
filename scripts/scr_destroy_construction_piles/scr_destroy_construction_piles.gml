/// @description Destroys the MDU piles
function scr_destroy_construction_piles(argument0) {
	var arg_construction = argument0;

	var piles = arg_construction[? construction_mdu_piles];
	if(is_undefined(piles) || piles == noone) exit;
	for(var n = 0; n < ds_list_size(piles); n++)
	{
		var next_pile = ds_list_find_value(piles, n);
		instance_destroy(next_pile);
	}
	ds_list_destroy(piles);


}
