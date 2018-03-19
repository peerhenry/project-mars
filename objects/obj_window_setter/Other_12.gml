/// @description Set GUI size

if(debug_steps && !show_question("Set GUI size="+string(width)+"x"+string(height)+"?")) exit;
		
scr_trace("obj_window_setter: display_set_gui_size " + string(width) + "x" + string(height));
display_set_gui_size(width, height); //resize the gui to fit the new resolution so any draw GUI events will appear in the correct place.