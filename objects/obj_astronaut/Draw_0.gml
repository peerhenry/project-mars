draw_healthbar(x - 12, y - 17, x + 12, y - 15, astronaut_health, c_black, c_red, c_lime, 0, true, false)
if(wears_suit) 	// draw oxygen bar
{
	draw_healthbar(x - 12, y - 15, x + 12, y - 13, suit_oxygen, c_black, global.oxygen_bar_color, global.oxygen_bar_color, 0, true, false);
}

shader_set(shader_mask);

var mask_color_handle = shader_get_uniform( shader_mask, "maskColor" );
shader_set_uniform_f_array( mask_color_handle, mask_color );

draw_self();
shader_reset();