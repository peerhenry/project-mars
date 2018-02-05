/// @arg shooter
/// @arg target
var shooter = argument0;
var target = argument1;

var get_layer_for = resolve(shooter.script_container, "get_layer_for");
var p_layer = script_execute(get_layer_for, obj_projectile);
var new_projectile = instance_create_layer(shooter.x, shooter.y, p_layer, obj_projectile);
with(new_projectile)
{
	var can_shoot = mp_linear_path(path, target.x, target.y, global.projectile_speed, false);
	if(!can_shoot)
	{
		instance_destroy();
		return false;
	}
	path_start(path, global.projectile_speed, path_action_stop, false);	// false: don't go along an absolute path, go relative to your position	
	
	var pd = point_direction(shooter.x, shooter.y, target.x, target.y);
	var dd = angle_difference(image_angle, pd);
	image_angle -= dd;
}