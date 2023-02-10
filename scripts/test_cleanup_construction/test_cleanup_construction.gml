function test_cleanup_construction(argument0) {
	var con = argument0;
	scr_unregister_construction(con);
	instance_destroy(con[? construction_object]);
	var pile_list = con[? construction_mdu_piles];
	for(var n = 0; n < ds_list_size(pile_list); n++)
	{
		var next_pile = pile_list[| n];
		instance_destroy(next_pile);
	}
	ds_map_destroy(con);


}
