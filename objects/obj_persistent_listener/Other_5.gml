scr_trace("Room End: id=" + string(room) + ", name=" + room_get_name(room));

//save current room as origin for the next, unless boot or test
if(room != room_boot && room != room_tests)
{
	global.room_origin = room;
}