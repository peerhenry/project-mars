wave_number = 0;
wave_time = 60; // in seconds
max_spawn_count = 20; // do not spawn more than this in one batch
cancel_spawn_count = 100; // do not spawn if there are more than this many movables on map
if(!global.dev_env) alarm[0] = room_speed*2;

enum spawn_from
{
	location,
	all_borders,
	east,
	north,
	west,
	south
}

spawn_source = spawn_from.location;