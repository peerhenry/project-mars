var new_hatch = argument0;

var adj_rooms = ds_list_create();

scr_add_room_to_list_if_basetile(new_hatch.x+32, new_hatch.y, adj_rooms);
scr_add_room_to_list_if_basetile(new_hatch.x-32, new_hatch.y, adj_rooms);
scr_add_room_to_list_if_basetile(new_hatch.x, new_hatch.y+32, adj_rooms);
scr_add_room_to_list_if_basetile(new_hatch.x, new_hatch.y-32, adj_rooms);

if(ds_list_size(adj_rooms) != 1) // PROBLEM!!!
{
	show_error("Hatches cannot attach to multiple rooms, fix it!", true)
}
else{
	var theroom = ds_list_find_value(adj_rooms, 0);
	with(theroom){
		ds_list_add(hatches, new_hatch);
	}
}