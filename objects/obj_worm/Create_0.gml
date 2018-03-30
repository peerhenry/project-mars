enum worm_action
{
	idle,
	navigating_to_basetile,
	attacking_basetile,
	emerging
}

path = noone;
worm_speed_underground = global.worm_speed_underground; // todo: move to settings
worm_speed = global.worm_speed;
current_action = worm_action.idle;
basetile_target = noone;

bump_pause_seconds = 2;
is_bumping = false;