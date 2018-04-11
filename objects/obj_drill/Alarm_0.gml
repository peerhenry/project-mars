/// @description mine metal
scr_trace("obj_drill alarm 0");
in(f_drill_mine, "mine", id);

// As long as resource is not depleted, always repeat the alarm to see if mining can continue
if(instance_exists(resource_instance) && resource_instance.amount > 0)
{
	alarm_set(macro_alarm_mine_metal, room_speed); // 1 second
}