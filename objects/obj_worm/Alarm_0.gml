/// @description Bump against basetile

is_bumping = true;

with(basetile_target)
{
	// execute bump
	resolve_execute(script_container, "create_instance", x, y, obj_bump);
	
	damage += other.bump_damage;
	
	if(damage >= 100)
	{
		damage = 100;
		other.is_bumping = false;
		resolve_execute(script_container, "play_sound", sound_fx_breach);
		scr_worm_emerge(other);
	}
	else // continue bumping
	{
		var next_alarm = (other.bump_pause_seconds*room_speed);
		other.alarm[0] = next_alarm;
	}
}