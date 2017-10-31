var arg_construction_cell_list = argument0;
var total = 0;
for(var n = 0; n<ds_list_size(arg_construction_cell_list); n++)
{
	var next_cell = arg_construction_cell_list[|n];
	var added_instance = next_cell[?c_cell_new_instance];
	var added_object_index = noone;
	if(added_instance != noone) added_object_index = added_instance.object_index;
	var removal_object_index = next_cell[?c_cell_object_to_remove];
	total += (scr_get_mdu_count(added_object_index) - scr_get_mdu_count(removal_object_index));
}

return ceil(total);