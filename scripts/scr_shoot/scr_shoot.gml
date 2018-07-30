/// @param script_container
/// @param shooter
/// @param target
var container = argument0;
var shooter = argument1;
var target = argument2;

var weapon = shooter.equipped_item;
var shot = false;

if( weapon.type == inv_space.rifle  && weapon.charge > 0 )
{
	shot = scr_create_rifle_shot(shooter, target);
	weapon.charge -= 1;
	if(weapon.charge < 0) weapon.charge = 0;
}
else if( weapon.type == inv_space.pistol  && weapon.charge > 0 )
{
	shot = scr_create_projectile(shooter, target);
	if(shot)
	{
		// play laser 1
		weapon.charge -= 1;
		resolve_execute(container, "play_sound_at", sound_fx_laser, shooter.x, shooter.y, false);
	}
}

if(!shot) return false;

// orient shooter towards target
with(shooter)
{
	var dx = target.x - x;
	var dy = target.y - y;
	var shoot_direction;

	if(dy > dx)
	{
		if(dy > -dx) shoot_direction = macro_down;
		else shoot_direction = macro_right;
	}
	else
	{
		if(dy > -dx) shoot_direction = macro_left;
		else shoot_direction = macro_up;
	}
	
	scr_set_pistol_sprite(id, shoot_direction, true);
}

return true;