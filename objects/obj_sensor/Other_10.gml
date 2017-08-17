scr_trace("Grid update event");
/// @description Grid update notification
if(scr_can_draw_power(id))
{
	sprite_index = spr_sensor_on;
}
else	// low power
{
	sprite_index = spr_sensor;
}