/// @param grid
function scr_grid_notify_components(argument0) {
	var arg_grid = argument0;

	for(var role = 0; role < macro_grid_role_count; role++)
	{
		var next_list = arg_grid.logic_map[? role];
		for(var n = 0; n < ds_list_size(next_list); n++)
		{
			var next_component = ds_list_find_value(next_list, n);
			with(next_component)
			{
				event_user(macro_event_grid_notify);
			}
		}
	}


}
