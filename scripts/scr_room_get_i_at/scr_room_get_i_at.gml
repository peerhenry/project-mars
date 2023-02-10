function scr_room_get_i_at(argument0) {
	var val = ds_list_find_value(tiles, argument0);
	return (val >> 16);


}
