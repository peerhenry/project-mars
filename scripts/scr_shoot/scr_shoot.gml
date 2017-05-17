var origin_x = argument0;
var origin_y = argument1;
var target_x = argument2;
var target_y = argument3;

var lid = layer_get_id("astronauts");
var new_projectile = instance_create_layer(origin_x, origin_y, lid, obj_projectile);
with(new_projectile)
{
	//path_add_point(new_projectile.path, origin_x, origin_y, global.projectile_speed);
	//path_add_point(new_projectile.path, target_x, target_y, global.projectile_speed);
	mp_linear_path(path, target_x, target_y, global.projectile_speed, false);
	path_start(path, global.projectile_speed, path_action_stop, false);	// false: don't go along an absolute path, go relative to your position	
}

audio_play_sound(sound_fx_laser, 0, 0);