/// Connect door to rooms
var door = argument0;

with(door)
{
	if(image_angle == 0)
	{
		room1 = scr_room_at(x, y-32); // room north of door
		room2 = scr_room_at(x, y+32); // room south of door
	}
	else
	{
		room1 = scr_room_at(x-32, y); // room west of door
		room2 = scr_room_at(x+32, y); // room east of door
	}
	if(ds_list_find_index(room1.doors, door) == -1) ds_list_add(room1.doors, door);
	if(room2 != room1 && ds_list_find_index(room2.doors, door) == -1) ds_list_add(room2.doors, door);
	
	// show_message("A door was connected at: " + string(x) + ", " + + string(y)); // DEBUG
}