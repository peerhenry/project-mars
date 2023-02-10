/// @arg construction
function scr_destroy_construction_cells(argument0) {
	var arg_construction = argument0;
	var construction_cells_list = ds_map_find_value(arg_construction, construction_cells);
	for(var n = 0; n< ds_list_size(construction_cells_list); n++)
	{
		var next_cell = construction_cells_list[|n];
		var added_instance = next_cell[?c_cell_new_instance];
		with(added_instance)
		{
			instance_destroy();
		}
		ds_map_destroy(next_cell);
	}
	ds_list_destroy(construction_cells_list);


}
