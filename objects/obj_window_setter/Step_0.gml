switch(step_number) //each case is a different step.
{
    case 0:
		show_debug_message("obj_window_setter: display_reset " + string(aa_level) + " " + string(vsync));
        display_reset(aa_level, vsync); //not too surprising that resetting the display comes first. Only necessary if you give players the option to change aa_level and vsync in game
		global.window_aa_level = aa_level;
		global.window_vsync = vsync;
        break;

    case 1:
        show_debug_message("obj_window_setter: window_set_size " + string(width) + "x" + string(height));
		window_set_position(display_x, display_y);
		window_set_size(width, height); //this is the only function that needs to run on a separate step. I've found it will not work correctly if used in the same step as the other functions
		global.window_x = display_x;
		global.window_y = display_y;
		global.window_width = width;
		global.window_height = height;
        break;

    case 2:
		show_debug_message("obj_window_setter: window_set_fullscreen " + string(fullscreen));
        window_set_fullscreen(fullscreen); //if setting it to fullscreen (true), window_set_size() won't have any effect.
		global.window_fullscreen = fullscreen;
        break;

    case 3:
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
		show_debug_message("obj_window_setter: surface_resize " + string(surface_width) + "x" + string(surface_height));
		
		camera_set_view_size(view_camera[0], surface_width, surface_height);
		show_debug_message("obj_window_setter: camera_set_view_size " + string(surface_width) + "x" + string(surface_height));
		
		view_wport[0] = width;
		view_hport[0] = height;
		show_debug_message("obj_window_setter: view_w/hport[0] " + string(view_wport[0]) + "x" + string(view_hport[0]));
		
		show_debug_message("obj_window_setter: display_set_gui_size " + string(width) + "x" + string(height));
        display_set_gui_size(width, height); //resize the gui to fit the new resolution so any draw GUI events will appear in the correct place.
		global.window_midpoint = [global.window_width / 2, global.window_height / 2];
        break;

    default:
		show_debug_message("obj_window_setter: instance_destroy");
        instance_destroy(); //destroy the instance for all other values of step_number
		if(script_exists(callback)) script_execute(callback);
        break;
}

++step_number; //increment step number so it will cycle through all the cases