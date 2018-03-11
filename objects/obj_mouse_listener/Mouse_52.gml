var dx = display_mouse_get_x() - last_mouse_x;
var dy = display_mouse_get_y() - last_mouse_y;

var cam = view_camera[0];
var cx = camera_get_view_x(cam);
var cy = camera_get_view_y(cam);

scr_set_cam_pos_safe(cx - dx, cy - dy);

last_mouse_x = display_mouse_get_x();
last_mouse_y = display_mouse_get_y();