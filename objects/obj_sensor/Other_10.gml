if(scr_can_draw_power(id))
{
	is_active = true;
	sprite_index = spr_sensor_on;
}
else	// low power
{
	is_active = false;
	sprite_index = spr_sensor;
}