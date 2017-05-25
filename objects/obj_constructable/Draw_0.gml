if(under_construction)
{
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_aqua, 0.4);
	draw_set_alpha(1);
}
else
{
	draw_self();
}