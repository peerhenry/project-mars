switch(step_number) //each case is a different step.
{
    case 0:
		//show_message("ows 0");
		var info = "Set window async: ";
		info += "size=" + string(width) + "x" + string(height);
		info += ", pos=" + string(display_x) + "," + string(display_y);
		info += ", fullscreen=" + string(fullscreen);
		info += ", aa=" + string(aa_level);
		info += ", vsync=" + string(vsync);
		scr_force_trace(info);
		
		if(aa_level != 0)
		{
			if((display_aa & aa_level) != display_aa) //requested aa level not supported by video device
			{
				scr_force_trace("Requested aa_level not supported, fallback to 0"); //todo: fallback to nearest lower supported aa level
				aa_level = 0;
			}
		}
		
		if(aa_level != global.window_aa_level || vsync != global.window_vsync) //needs update (warning: display_reset causes window to reset position to primary monitor)
		{
			scr_trace("obj_window_setter: display_reset " + string(aa_level) + " " + string(vsync));
	        display_reset(aa_level, vsync); //not too surprising that resetting the display comes first. Only necessary if you give players the option to change aa_level and vsync in game
			global.window_aa_level = aa_level;
			global.window_vsync = vsync;
		}
		else scr_trace("obj_window_setter: skipping display_reset with same values");
        break;

    case 1:
		//show_message("ows 1");
		// resume current window position
		if(display_x == -1) display_x = window_get_x();
		if(display_y == -1) display_y = window_get_y();
		
		// auto recenter window position
		if(display_x == -2) display_x = display_get_width() / 2 - width / 2;
		if(display_y == -2) display_y = display_get_height() / 2 - height / 2;
	
        scr_force_trace("obj_window_setter: window_set_position " + string(display_x) + "x" + string(display_y));
		window_set_position(display_x, display_y);
		
		scr_trace("obj_window_setter: window_set_size " + string(width) + "x" + string(height));
		window_set_size(width, height); //this is the only function that needs to run on a separate step. I've found it will not work correctly if used in the same step as the other functions
		global.window_x = display_x;
		global.window_y = display_y;
		global.window_width = width;
		global.window_height = height;
        break;

    case 2:
		//show_message("ows 2");
		scr_trace("obj_window_setter: window_set_fullscreen " + string(fullscreen));
        window_set_fullscreen(fullscreen); //if setting it to fullscreen (true), window_set_size() won't have any effect.
		global.window_fullscreen = fullscreen;
        break;

    case 3:
		//show_message("ows 3");
		// Set the resolution we've programmed the game for
		var base_width = macro_window_base_width;
		var base_height = macro_window_base_height;

		// Determine aspect ratio
		var aspect = base_width/base_height;

		// Work out the adjusted height and width to maintain aspect ratio
		var surface_height = min(base_height, height);
		var surface_width = height * aspect;

		// Resize the application surface to adjusted values
		surface_resize(application_surface, surface_width, surface_height); //This will resize the application surface so that it fills the screen/window correctly. Only use this along with views.
		scr_trace("obj_window_setter: surface_resize " + string(surface_width) + "x" + string(surface_height));
		
		camera_set_view_size(view_camera[0], surface_width, surface_height);
		scr_trace("obj_window_setter: camera_set_view_size " + string(surface_width) + "x" + string(surface_height));
		
		view_wport[0] = width;
		view_hport[0] = height;
		scr_trace("obj_window_setter: view_w/hport[0] " + string(view_wport[0]) + "x" + string(view_hport[0]));
		
		scr_trace("obj_window_setter: display_set_gui_size " + string(width) + "x" + string(height));
        display_set_gui_size(width, height); //resize the gui to fit the new resolution so any draw GUI events will appear in the correct place.
		global.window_midpoint = [global.window_width / 2, global.window_height / 2];
        break;

    default:
		//show_message("ows default");
		scr_trace("obj_window_setter: instance_destroy");
        instance_destroy(); //destroy the instance for all other values of step_number
		if(script_exists(callback)) script_execute(callback);
        break;
}

++step_number; //increment step number so it will cycle through all the cases