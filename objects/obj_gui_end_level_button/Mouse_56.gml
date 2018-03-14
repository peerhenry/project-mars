if(hover)
{
	if(level != noone) 
	{
		with(level)
		{
			if(other.mission_accomplished) event_user(0);
			else event_user(1);
		}
	}
	room_goto(return_room);
}