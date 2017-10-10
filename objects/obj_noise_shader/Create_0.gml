noise_index = 0;
dark_band_pos = 0.0;
dark_band_thickness = 0.008;

// uniform handles
noise_tex_handle = shader_get_sampler_index(shader_noise, "noiseTexture");
dark_band_thickness_handle = shader_get_uniform(shader_noise, "dark_band_thickness");
dark_band_pos_handle = shader_get_uniform(shader_noise, "dark_band_pos");
uvs_noise_handle = shader_get_uniform(shader_noise, "uvs_noise");

// set dark band thickness
shader_set(shader_noise);
shader_set_uniform_f(dark_band_thickness_handle, dark_band_thickness);
shader_reset();