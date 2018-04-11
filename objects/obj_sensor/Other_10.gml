/// @description Grid update notification
var can_draw_power = resolve_execute(script_container, "can_draw_power", id);
if(can_draw_power)
{
	sprite_index = spr_sensor_on;
}
else	// low power
{
	sprite_index = spr_sensor;
}