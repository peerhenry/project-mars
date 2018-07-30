/// @arg x
/// @arg y
var arg_x = argument0;
var arg_y = argument1;

var cam = view_camera[0];
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);
var new_x = arg_x - cam_w/2;
var new_y = arg_y - cam_h/2;

scr_set_cam_pos_safe(new_x, new_y);