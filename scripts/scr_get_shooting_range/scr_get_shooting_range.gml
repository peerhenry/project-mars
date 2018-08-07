/// @description returns shooting range in tiles
/// @arg shooter
var arg_shooter = argument0
var weapon = arg_shooter.equipped_item;
if(weapon == noone) return 0;
return weapon.range;