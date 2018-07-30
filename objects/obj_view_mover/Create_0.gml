if( instance_number(object_index) > 1 ) show_error("more than one: " + string( object_get_name(object_index) ), true);
cam = view_camera[0];
scroll_border = 5;

// initialize audio listener
var should_use_stereo = false; // maybe move this flag to settings
if(should_use_stereo) audio_listener_orientation(0, 0, 1000, 0, -1, 0);
else audio_listener_orientation(-1000, 0, 0, 0, -1, 0);
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);
audio_listener_position(cam_x + cam_w/2, cam_y + cam_h/2, 0);