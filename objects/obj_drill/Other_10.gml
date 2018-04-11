/// @description Grid has updated
var can_draw_power = resolve_execute(script_container, "can_draw_power", id);
if(can_draw_power)
{
	image_speed = 1;
}
else	// low power
{
	image_index = 0;
	image_speed = 0;
}