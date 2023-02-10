/// @description returns shooting range in tiles
/// @arg shooter
function scr_get_shooting_range(argument0) {
	var arg_shooter = argument0
	var weapon = arg_shooter.equipped_item;
	if(weapon == noone) return 0;
	return weapon.range;


}
