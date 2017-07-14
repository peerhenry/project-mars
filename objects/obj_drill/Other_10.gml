/// @description set the is_active boolean here
if(scr_can_draw_power(id) && has_resource)
{
	is_active = true;
	image_speed = 1;
}
else	// low power
{
	is_active = false;
	image_index = 0;
	image_speed = 0;
}