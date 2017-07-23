/// Connect door to rooms
var door = argument0;

with(door)
{
	var x1 = 0;
	var y1 = 0;
	var x2 = 0;
	var y2 = 0;
	if(sprite_index == spr_door_tall)
	{
		x1 = x;
		y1 = y-32;	// north of door
		x2 = x;
		y2 = y+32;	// south of door
	}
	else
	{
		x1 = x-32;	// west
		y1 = y;
		x2 = x+32;	// east
		y2 = y;
	}
	
	room1 = scr_room_at(x1, y1); // room north of door
	room2 = scr_room_at(x2, y2); // room south of door
	
	// if room 1 or 2 is noone, it may be because there is a door...
	if(room1 == noone)
	{
		var door1_instead = instance_position(x1, y1, obj_door);
	}
	if(room2 == noone)
	{
		var door2_instead = instance_position(x2, y2, obj_door);
	}
	
	if(room1 == noone || room2 == noone) show_error("room1 or room2 did not exist for door in scr_door_connect", true);
	
	if(ds_list_find_index(room1.doors, door) == -1)
	{
		ds_list_add(room1.doors, door);
	}
	if(room2 != room1 && ds_list_find_index(room2.doors, door) == -1)
	{
		ds_list_add(room2.doors, door);
	}
}