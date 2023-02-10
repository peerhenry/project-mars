/// @arg cart_or_robot
function scr_update_robot(argument0) {
	with(argument0)
	{
		if(battery_charge == 0)
		{
			// todo: wait for recharge, after which movement_speed should be reset
		}
	
		if(battery_charge > 0)
		{
			battery_charge -= global.robot_idle_battery_drain;
			if(path_exists(path)) battery_charge -= global.robot_move_battery_drain;
		
			if(battery_charge < 0)
			{
				battery_charge = 0;
				movement_speed = 0;
			}
		}
	}


}
