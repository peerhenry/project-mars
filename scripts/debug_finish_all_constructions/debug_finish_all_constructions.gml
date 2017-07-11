var cq = global.construction_queue;
var count = ds_list_size(cq);
var temp_list = ds_list_create();
ds_list_copy(temp_list, cq);
for(var n = 0; n < count; n++)
{
	var next_construction = ds_list_find_value(temp_list, n);
	if(next_construction[construction_build_state] != construction_state.done) debug_finish_construction(next_construction);
}
ds_list_destroy(temp_list);