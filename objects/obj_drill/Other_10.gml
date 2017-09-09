/// @description Grid has updated
if(scr_can_draw_power(id))
{
	image_speed = 1;
}
else	// low power
{
	image_index = 0;
	image_speed = 0;
}