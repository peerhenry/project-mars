/// @description connect hatch to room
/// @param hatch
function scr_hatch_connect(argument0) {
	var arg_hatch = argument0;

	var adj_rooms = ds_list_create();
	with(arg_hatch)
	{
		scr_add_room_at(x+32, y, adj_rooms);
		scr_add_room_at(x-32, y, adj_rooms);
		scr_add_room_at(x, y+32, adj_rooms);
		scr_add_room_at(x, y-32, adj_rooms);	
	}

	var nr_of_adjacent_rooms = ds_list_size(adj_rooms);
	if(nr_of_adjacent_rooms  > 1) // PROBLEM!!!
	{
		show_error("Error: hatches cannot attach to multiple rooms!", true)
	}
	else if(nr_of_adjacent_rooms == 0)
	{
		show_error("Error: no room found for hatch to attach to!", true)
	}
	else
	{
		var the_room = ds_list_find_value(adj_rooms, 0);
		arg_hatch.base_room = the_room;
		with(the_room)
		{
			if(ds_list_find_index(hatches, arg_hatch) < 0)
			{
				ds_list_add(hatches, arg_hatch);
			}
		}
	}

	ds_list_destroy(adj_rooms);


}
