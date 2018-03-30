/// @description Bump against basetile

is_bumping = true;

var bump_damage = 20;

with(basetile_target)
{
	// execute bump
	instance_create_layer(x, y, macro_logic_layer, obj_bump); // todo: use DI
	damage += bump_damage;
	
	if(damage >= 100)
	{
		damage = 100;
		other.is_bumping = false;
		scr_worm_emerge(other);
	}
	else // continue bumping
	{
		var next_alarm = (other.bump_pause_seconds*room_speed);
		other.alarm[0] = next_alarm;
	}
}