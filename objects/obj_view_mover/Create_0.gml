if( instance_number(object_index) > 1 ) show_error("more than one: " + string( object_get_name(object_index) ), true);
cam = view_camera[0];
scroll_border = 5;

audio_listener_orientation(0, 0, 1000, 0, -1, 0);