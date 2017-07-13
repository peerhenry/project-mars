if(scr_can_draw_power(id) && has_resource)
{
	image_speed = 1;
}
else	// low power
{
	next_consumer.image_index = 0;
	next_consumer.image_speed = 0;
}