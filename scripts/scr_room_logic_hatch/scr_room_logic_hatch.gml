var new_hatch = argument0;

var adj_rooms = ds_list_create();

with(new_hatch)
{
	// show_debug_message("new hatch room logic with x: " + string(x) + " and y: " + string(y)); // DEBUG
	scr_add_room_at(x+32, y, adj_rooms);
	scr_add_room_at(x-32, y, adj_rooms);
	scr_add_room_at(x, y+32, adj_rooms);
	scr_add_room_at(x, y-32, adj_rooms);
}

var nr_of_adjacent_rooms = ds_list_size(adj_rooms);
if(nr_of_adjacent_rooms  > 1) // PROBLEM!!!
{
	show_error("Hatches cannot attach to multiple rooms, fix it!", true)
}
else if(nr_of_adjacent_rooms == 0)
{
	show_error("No room found for hatch to attach to, fix it!", true)
}
else{
	var theroom = ds_list_find_value(adj_rooms, 0);
	with(theroom){
		ds_list_add(hatches, new_hatch);
	}
}

ds_list_destroy(adj_rooms);