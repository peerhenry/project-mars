/// @description Grid update notification

has_power = scr_can_draw_from_grid(id, macro_grid_electric);
if(has_power)
{
	image_index = 0;
}
else
{
	image_index = 1;
}