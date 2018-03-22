scr_force_trace("Room Start: id=" + string(room) + ", name=" + room_get_name(room));

// -- exclusions --
if(room == room_boot) exit;
if(room == room_tests) exit;

// -- for all rooms --
application_surface_draw_enable(true); //reenable after obj_surface_renderer //todo: exclude for game rooms with shader enabled
cursor_sprite = spr_cursor;

//todo: discuss this
//when entering a room, the defined camera size causes auto scaling to the current window size
camera_set_view_size(view_camera[view_current], window_get_width(), window_get_height());