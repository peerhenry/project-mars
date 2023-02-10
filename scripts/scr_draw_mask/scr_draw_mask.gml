function scr_draw_mask(argument0) {
	with(argument0)
	{
		if(mask_sprite != noone)
		{
			shader_set(shader_mask);
			var handle = shader_get_uniform( shader_mask, "MaskColor" );
			shader_set_uniform_f_array(handle, mask_color);
			draw_sprite_ext( mask_sprite, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1 );
			shader_reset();
		}
	}


}
