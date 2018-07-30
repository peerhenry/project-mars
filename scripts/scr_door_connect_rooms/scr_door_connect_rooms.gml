/// Connect door to rooms
var door = argument0;

with(door)
{
	var x1 = 0;
	var y1 = 0;
	var x2 = 0;
	var y2 = 0;
	if(connects_horizontally)
	{
		x1 = x-31;	// west
		y1 = y;
		x2 = x+31;	// east
		y2 = y;
	}
	else
	{
		x1 = x;
		y1 = y-31;	// north of door
		x2 = x;
		y2 = y+31;	// south of door
	}
	
	// Get adjacent doors
	door1 = instance_position(x1, y1, obj_door); // North or West
	door2 = instance_position(x2, y2, obj_door); // East or South
	var adj_door_count = 0;
	
	// if room 1 or 2 is noone, it may be because there is a door...
	if(door1 != noone && !door1.under_construction)
	{
		adj_door_count++;
		room1 = door1.room2;
	}
	else room1 = scr_room_at(x1, y1); // room north or west of door
	
	if(door2 != noone && !door2.under_construction)
	{
		adj_door_count++;
		room2 = door2.room1;
	}
	else room2 = scr_room_at(x2, y2); // room south or east of door
	
	if(adj_door_count == 1)
	{
		// The north room of this door must equal the north room of the south door, or vice versa
		if(room1 == room2)
		{
			if(door1 != noone)
			{
				// Remove door1 from room2
				var door1_index = ds_list_find_index(room2.doors, door1);
				if(door1_index > -1) ds_list_delete(room2.doors, door1_index);
				// Create room between this door and adjacent door
				room1 = scr_create_room_between_doors(door1, id);
			
				// Replace the room for the other door
				door1.room2 = room1;
			}
			if(door2 != noone)
			{
				// Remove door2 from room1
				var door2_index = ds_list_find_index(room1.doors, door2);
				if(door2_index > -1) ds_list_delete(room1.doors, door2_index);
				// Create room between this door and adjacent door
				room2 = scr_create_room_between_doors(id, door2);
			
				// Replace room1 in door2
				door2.room1 = room2;
			}
		}
		//else show_debug_message("room1 did not equal room2: " + string(room1) + ", " + + string(room2) + ". Tilecounts: " + string(ds_list_size(room1.tiles)) + ", " + string(ds_list_size(room2.tiles)));
		else show_error("room1 did not equal room2: " + string(room1) + ", " + + string(room2) + ". Tilecounts: " + string(ds_list_size(room1.tiles)) + ", " + string(ds_list_size(room2.tiles)), true);
	}
	else if(adj_door_count == 2)
	{
		// The room at this position should have been destroyed because there are no tiles left
		room1 = scr_create_room_between_doors(door1, id);
		room2 = scr_create_room_between_doors(id, door2);
		
		// Set the new rooms in the adjacent doors
		door1.room2 = room1;
		door2.room1 = room2;
	}
	
	if(room1 == noone || room2 == noone) scr_panic("room1 or room2 did not exist for door in scr_door_connect_rooms");
	
	// Add this door the the adjacent rooms if it aint there yet.
	if(ds_list_find_index(room1.doors, door) == -1)
	{
		ds_list_add(room1.doors, door);
	}
	if(room2 != room1 && ds_list_find_index(room2.doors, door) == -1)
	{
		ds_list_add(room2.doors, door);
	}
}