if( !instance_exists(target) )
{
	instance_destroy();
	exit;
}
var shot = scr_create_projectile(shooter, target);
if(shot)
{
	if(instance_number(obj_rifle_sound) == 0) instance_create_depth(x, y, 0, obj_rifle_sound);
	shot_count++;
	if(shot_count == 3) instance_destroy();
	else alarm[0] = 5;
}
else instance_destroy();