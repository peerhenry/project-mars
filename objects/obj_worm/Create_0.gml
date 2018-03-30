enum worm_action
{
	idle,
	navigating_to_basetile,
	attacking_basetile,
	emerging
}

current_action = worm_action.idle;
basetile_target = noone;