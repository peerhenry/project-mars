if(under_construction)
{
	shader_set(shader_noise);
	
	// set tex uvs
	var uvs_tex = sprite_get_uvs(sprite_index, image_index);
	//show_debug_message("setting uvs for: " + sprite_get_name(sprite_index)); // DEBUG
	var uvs_tex_handle = shader_get_uniform(shader_noise, "uvs_tex");
	//if(uvs_tex[2] - uvs_tex[0] < 0 || uvs_tex[3] - uvs_tex[1] < 0) show_error("w/h < 0", true);
	shader_set_uniform_f(
		uvs_tex_handle, 
		uvs_tex[0], 
		uvs_tex[1], 
		uvs_tex[2] - uvs_tex[0], 
		uvs_tex[3] - uvs_tex[1]); // or_u, or_v, width, height
	
	var obj_j_handle = shader_get_uniform(shader_noise, "obj_j");
	shader_set_uniform_i(obj_j_handle, occ_j);
	
	// draw
	//draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_aqua, 0.4);
	draw_sprite(sprite_index, image_index, x, y);
	
	shader_reset();
}
else
{
	draw_self();
}
