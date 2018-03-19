scr_force_trace("Entering room window test ..");

application_surface_draw_enable(true); //reenable after obj_surface_renderer

//todo: discuss this
//when entering a room, the defined camera size causes auto scaling to the current window size
camera_set_view_size(view_camera[view_current], window_get_width(), window_get_height());