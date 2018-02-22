/// @arg x
/// @arg y
var new_x = argument0;
var new_y = argument1;
var cam = view_camera[0];
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

if(new_x + cam_w > room_width) new_x = room_width - cam_w;
else if(new_x < 0) new_x = 0;

if(new_y + cam_h > room_height) new_y = room_height - cam_h;
else if(new_y < 0) new_y = 0;

camera_set_view_pos(cam, new_x, new_y);