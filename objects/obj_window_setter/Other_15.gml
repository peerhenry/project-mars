/// @description Set camera size and view port

if(debug_steps && !show_question("Set camera size="+string(width)+"x"+string(height)+" and view port size="+string(width)+"x"+string(height)+"?")) exit;

scr_trace("obj_window_setter: camera_set_view_size " + string(width) + "x" + string(height));
camera_set_view_size(view_camera[0], width, height);
		
scr_trace("obj_window_setter: view_w/hport[0] " + string(width) + "x" + string(height));
view_wport[0] = width;
view_hport[0] = height;