///Check if tile belongs to room.
function scr_check_tile_in_room(argument0, argument1, argument2) {
	var le_room = argument0;
	var i = argument1;
	var j = argument2;

	with(le_room){
		var val_to_check = (i << 16) + j;
		var pos = ds_list_find_index(tiles, val_to_check);
		return pos > -1;
	}

	return false;


}
