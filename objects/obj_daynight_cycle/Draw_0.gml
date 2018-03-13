draw_set_alpha(image_alpha);
//gpu_set_blendmode(bm_add);
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false); //todo: use projected viewport size (don't render whole room in world space)
draw_set_alpha(1);
//gpu_set_blendmode(bm_normal);
