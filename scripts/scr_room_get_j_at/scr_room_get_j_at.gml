function scr_room_get_j_at(argument0) {
	var val = ds_list_find_value(tiles, argument0);
	var two_to_sixteen = 65536;
	return (val mod two_to_sixteen);


}
