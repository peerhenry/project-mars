var cqm = global.construction_queue_map;
var queues = [ ds_map_find_value(cqm, macro_player), ds_map_find_value(cqm, macro_enemy) ];

for(var n = 0; n < array_length_1d(queues); n++)
{
	var next_queue = queues[n];
	var temp = ds_list_create();
	for(var m = 0; m < ds_list_size(next_queue); m++)
	{
		ds_list_add(temp, ds_list_find_value(next_queue, m));
	}
	for(var m = 0; m < ds_list_size(temp); m++)
	{
		var next_construction = ds_list_find_value(temp, m);
		scr_destroy_construction(next_construction);
	}
	ds_list_destroy(temp);
}