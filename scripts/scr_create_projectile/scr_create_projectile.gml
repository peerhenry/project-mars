/// @arg shooter
/// @arg target
function scr_create_projectile(argument0, argument1) {
	var shooter = argument0;
	var target = argument1;

	// shooter or target may have died before this script
	if(!instance_exists(shooter) || !instance_exists(target)) return false;

	var get_layer_for = resolve_script(global.script_container, "get_layer_for");
	var p_layer = script_execute(get_layer_for, obj_projectile);
	var new_projectile = instance_create_layer(shooter.x, shooter.y, p_layer, obj_projectile);

	var weapon = shooter.equipped_item;

	var weapon_damage = weapon.damage;
	var damage_factor = scr_rules_get("weapons", "projectile_damage_factor");

	var weapon_proj_speed = weapon.projectile_speed;
	var speed_factor = scr_rules_get("weapons", "projectile_speed_factor");

	with(new_projectile)
	{
		damage = damage_factor*weapon_damage;
		projectile_speed = speed_factor*weapon_proj_speed;
		path_add_point(path, x, y, 100);
		path_add_point(path, target.x, target.y, 100);
		path_set_closed(path, false); // so it doesn't go back
		path_start(path, projectile_speed, path_action_stop, false);	// false: don't go along an absolute path, go relative to your position	
		var pd = point_direction(shooter.x, shooter.y, target.x, target.y);
		var dd = angle_difference(image_angle, pd);
		image_angle -= dd;
	}
	return true;


}
