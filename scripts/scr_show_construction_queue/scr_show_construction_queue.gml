var constr_queue = global.construction_queue;

var construction_count = ds_list_size(constr_queue);
for(var n = 0; n < construction_count; n++)
{
	var next_construction = ds_list_find_value(constr_queue, n);
	
	show_debug_message("");
	show_debug_message("next construction: ");
	debug_show_construction(next_construction);
	show_debug_message("");
}