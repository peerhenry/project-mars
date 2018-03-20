switch(step_number)
{
    case 0:
		var info = "Set window async: ";
		info += "size=" + string(width) + "x" + string(height);
		info += ", pos=" + string(display_x) + "," + string(display_y);
		info += ", fullscreen=" + string(fullscreen);
		info += ", aa=" + string(aa_level);
		info += ", vsync=" + string(vsync);
		scr_force_trace(info);
		
		event_user(0); // Set AA-level and vsync
		event_user(1); // Set window size and position (contents will scale to fit with letterbox effect)
		event_user(2); // Set GUI size
		event_user(3); // Set fullscreen or windowed
		event_user(4); // Resize application surface
		event_user(5); // Set camera size and view port
        break;

    default:
		scr_trace("obj_window_setter: instance_destroy");
		debug_window_info();
        instance_destroy();
		if(script_exists(callback)) script_execute(callback);
        break;
}

step_number++;