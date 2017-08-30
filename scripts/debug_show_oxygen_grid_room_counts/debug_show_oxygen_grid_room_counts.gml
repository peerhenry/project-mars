with(obj_grid)
{
	var room_count = 0;
	if(grid_type == macro_grid_oxygen)
	{
		var consumers = logic_map[? macro_grid_role_consumer];
		for(var n = 0; n < ds_list_size(consumers); n++)
		{
			var next_c = ds_list_find_value(consumers, n);
			if(next_c.object_index == obj_room)
			{
				room_count++;
			}
		}
		show_debug_message("oxygen grid has " + string(room_count) + " rooms");
	}
}