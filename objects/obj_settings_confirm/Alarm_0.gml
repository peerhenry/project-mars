/// @description Countdown timer

if(countdown-- <= 0) //trigger
{
	event_user(2); // auto select "no"
	exit;
}

alarm[0] = room_speed; //call every second