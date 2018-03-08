/// @description Mouse Down

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

var map_pointer = [(window_mouse_x - x) / size[0], (window_mouse_y - y) / size[1]];
//show_debug_message("Clicked " + string(map_pointer[0]) + "," + string(map_pointer[1]));

scr_center_screen_xy(map_pointer[0] * room_width, map_pointer[1] * room_height);
