scr_trace("scr_room_logic_basetile");
var arg_x = argument0;
var arg_y = argument1;

var adj_rooms = ds_list_create();

scr_add_room_at(arg_x+32, arg_y, adj_rooms);
scr_add_room_at(arg_x-32, arg_y, adj_rooms);
scr_add_room_at(arg_x, arg_y+32, adj_rooms);
scr_add_room_at(arg_x, arg_y-32, adj_rooms);

var count = ds_list_size(adj_rooms); // maximum amount of distinct rooms

switch(count)
{
	case 0:
		// create new room
		scr_create_room_with_tile(arg_x, arg_y);
		break;
	case 1:
		// add tile to room
		scr_room_expand(ds_list_find_value(adj_rooms, 0), arg_x, arg_y);
		break;
	case 2:
		scr_room_join(
			arg_x, arg_y,
			ds_list_find_value(adj_rooms, 0),
			ds_list_find_value(adj_rooms, 1));
		break;
	case 3:
		scr_room_join_3(
			arg_x, arg_y,
			ds_list_find_value(adj_rooms, 0),
			ds_list_find_value(adj_rooms, 1),
			ds_list_find_value(adj_rooms, 2));
		break;
	case 4:
		scr_room_join_4(
			arg_x, arg_y,
			ds_list_find_value(adj_rooms, 0),
			ds_list_find_value(adj_rooms, 1),
			ds_list_find_value(adj_rooms, 2),
			ds_list_find_value(adj_rooms, 3));
		break;
}

ds_list_destroy(adj_rooms);