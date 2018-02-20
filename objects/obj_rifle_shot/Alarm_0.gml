if( !instance_exists(target) )
{
	instance_destroy();
	exit;
}
var shot = scr_create_projectile(shooter, target);
if(shot)
{
	var play_sound = script_container_resolve(shooter.script_container, "play_sound");
	script_execute(play_sound, sound_fx_laser_2);
	shot_count++;
	if(shot_count == 3) instance_destroy();
	else alarm[0] = 5;
}
else instance_destroy();