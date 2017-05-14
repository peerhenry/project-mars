/// Connect door to rooms
var door = argument0;

with(door)
{
	if(image_angle == 0 || image_angle == 180)
	{
		room1 = scr_room_at(x, y-32); // room north of door
		room2 = scr_room_at(x, y+32); // room south of door
	}
	else
	{
		room1 = scr_room_at(x-32, y); // room west of door
		room2 = scr_room_at(x+32, y); // room east of door
	}
	
	if(room1 == noone || room1 == undefined || room2 == noone || room2 == undefined) show_error("room1 or room2 did not exist for door in scr_door_connect", true);
	
	if(ds_list_find_index(room1.doors, door) == -1)
	{
		ds_list_add(room1.doors, door);
	}
	if(room2 != room1 && ds_list_find_index(room2.doors, door) == -1)
	{
		ds_list_add(room2.doors, door);
	}
}