/// @description Toggle shader (vk_alt)

use_shader=!use_shader;
application_surface_draw_enable(!use_shader);
show_debug_message("use_shader set to: " + string(use_shader));