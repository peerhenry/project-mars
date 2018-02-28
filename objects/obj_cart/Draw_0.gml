event_inherited();
if(carrying_instance != noone)
{
	draw_sprite(carrying_instance.sprite_index, carrying_instance.image_index, x, y - 2);
	// todo: draw handrail
}