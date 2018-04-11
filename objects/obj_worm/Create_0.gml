event_inherited();

enum worm_action
{
	idle,
	navigating_to_basetile,
	attacking_basetile,
	emerging
}
script_container = global.script_container;

is_underground = true;

worm_speed_underground = global.worm_speed_underground;
worm_speed = global.worm_speed;
current_action = worm_action.idle;
basetile_target = noone;

bump_pause_seconds = 2;
is_bumping = false;
bump_damage = global.worm_bump_damage;

// animation
animating = true;
animate_forward = true;
image_speed = 4;
sprite_index = spr_worm_sensor_alert;