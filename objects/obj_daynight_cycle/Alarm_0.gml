image_alpha += (sun_setting) ? tween_speed : -tween_speed;
if(image_alpha >= 1)
{
	sun_setting = false;
	image_alpha = 1;
}
else if(image_alpha <= 0)
{
	sun_setting = true;
	image_alpha = 0;
}

alarm[0] = 1;
