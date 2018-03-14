///Check if tile belongs to room.
var le_room = argument0;
var i = argument1;
var j = argument2;

with(le_room){
	var val_to_check = (i << 16) + j;
	var pos = ds_list_find_index(tiles, val_to_check);
	return pos > -1;
}

return false;