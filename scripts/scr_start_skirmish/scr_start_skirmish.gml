function scr_start_skirmish() {
	scr_trace("Starting skirmish...");
	global.level_object_index = noone;
	room_goto(room_map_skirmish);


}
