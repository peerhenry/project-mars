var arg_construction = argument0;
var construction_cells_array = ds_map_find_value(arg_construction, construction_cells);
if(is_array(construction_cells_array))
{
	var count = array_length_1d(construction_cells_array);
	var room_logic_instance = noone;
	for(var n = 0; n < count; n++) // loop over tiles
	{
		var next_cell = construction_cells_array[n];
		var added_instance = next_cell[c_cell_new_instance];
		with(added_instance)
		{
			instance_destroy();
		}
		construction_cells_array[@n] = 0;
	}
	ds_map_replace(arg_construction, construction_cells, 0);
	construction_cells_array = 0;
}