var le_room = argument0;

with(le_room){
	for(var n = 0; n< ds_list_size(doors); n++)
	{
		var next_door = ds_list_find_value(doors, n);
		scr_door_connect(next_door);
	}
}