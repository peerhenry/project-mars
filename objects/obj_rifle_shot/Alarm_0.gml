scr_create_projectile(shooter, target);
shot_count++;
if(shot_count == 3) instance_destroy();
else alarm[0] = 5;