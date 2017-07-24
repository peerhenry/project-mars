var height = window_get_height();
var width = window_get_width();
view_set_wport(0, width);
view_set_hport(0, height);
var cam = view_camera[0];
camera_set_view_size(cam, width/2, height/2);