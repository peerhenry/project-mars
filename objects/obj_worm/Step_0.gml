var time_to_destroy = 5;
var d_damage = 1/(room_speed*time_to_destroy);
if(current_action == worm_action.attacking_basetile)
{
	with(basetile_target)
	{
		damage += d_damage;
		if(damage > 100)
		{
			damage = 100;
			sprite = spr_base_tile_broken;
			other.current_action = worm_action.emerging;
			other.visible = true;
		}
	}
}