with(argument0)
{
	shader_set(shader_mask);
	var handle = shader_get_uniform( shader_mask, "MaskColor" );
	shader_set_uniform_f_array(handle, mask_color);
	draw_sprite_ext( mask_sprite, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1 );
	shader_reset();
}