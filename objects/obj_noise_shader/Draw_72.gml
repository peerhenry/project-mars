shader_set(shader_noise);

// set noise texture
var noise_tex = sprite_get_texture(spr_noise_32, 0);
texture_set_stage(noise_tex_handle, noise_tex);
// set noise uniforms
var uvs_noise = sprite_get_uvs(spr_noise_32, noise_index);
shader_set_uniform_f(uvs_noise_handle, uvs_noise[0], uvs_noise[1], uvs_noise[2] - uvs_noise[0], uvs_noise[3] - uvs_noise[1]); // or_u, or_v, width, height
// set dark band position
shader_set_uniform_f(dark_band_pos_handle, dark_band_pos);

shader_reset();