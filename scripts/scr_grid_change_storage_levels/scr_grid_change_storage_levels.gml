/// @param grid
function scr_grid_change_storage_levels(argument0) {
	with(argument0)
	{
		if(net_output != 0)
		{
			if(net_output > 0)
			{
				if(storage == storage_capacity) exit;
			}
			else if(storage == 0) exit;
	
			var output_surplus = net_output;
			var storage_list = logic_map[? macro_grid_role_storage];
			var size = ds_list_size(storage_list);
			var comp_index = 0;
		
			while(output_surplus != 0 && comp_index < size)
			{
				var next_component = ds_list_find_value(storage_list, comp_index);
				var grid_props = next_component.grid_props_map[? grid_type];
				var capacity = grid_props[macro_grid_prop_value];
				var level = grid_props[macro_grid_storage_level];
				var stored = capacity*level;
				var remaining_space = capacity - stored;
			
				if( output_surplus > 0 )
				{
					if( level < 1 )
					{
						if(output_surplus > remaining_space)
						{
							// fill storage, subtract from remaining surplus
							output_surplus -= remaining_space;
							grid_props[@macro_grid_storage_level] = 1;
						}
						else
						{
							// add surplus to storage
							grid_props[@macro_grid_storage_level] += (output_surplus/capacity);
							output_surplus = 0;
						}
					}
				}
				else if( output_surplus < 0 )
				{
					if( level > 0 )
					{
						if(stored > -output_surplus)
						{
							// subtract shortage from storage
							grid_props[@macro_grid_storage_level] += (output_surplus/capacity);
							output_surplus = 0;
						}
						else
						{
							// empty storage
							grid_props[@macro_grid_storage_level] = 0;
							output_surplus -= stored;
						}
					}
				}
			
				comp_index++;
			}
		}
	}


}
