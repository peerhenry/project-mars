/// @arg shooter
/// @arg target
var arg_shooter = argument0;
var arg_target = argument1;

var get_layer_for = resolve_script(arg_shooter.script_container, "get_layer_for");
var p_layer = script_execute(get_layer_for, obj_projectile);
var rifle_burst = instance_create_layer(arg_shooter.x, arg_shooter.y, p_layer, obj_rifle_shot);
with(rifle_burst)
{
	shooter = arg_shooter;
	target = arg_target;
	var dummy_path = path_add();
	var can_shoot = mp_linear_path(dummy_path, target.x, target.y, global.projectile_speed, false);
	path_delete(dummy_path);
	return can_shoot;
}