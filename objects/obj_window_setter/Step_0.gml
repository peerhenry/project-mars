switch(step_number)
{
    case 0:
		var info = "Set window: " + scr_format_size(width, height) + " ";
		info += fullscreen ? "fullscreen" : "windowed at " + scr_format_pos(window_x, window_y);
		info += ", aa=" + string(aa_level) + ", vsync=" + string(vsync);
		scr_force_trace(info);
		
		//save revert data
		global.window[? key_window_revert] = [
			global.window[? key_window_width],
			global.window[? key_window_height],
			global.window[? key_window_fullscreen],
			global.window[? key_window_aa_level],
			global.window[? key_window_vsync],
			global.window[? key_window_x],
			global.window[? key_window_y]
		];
		
		event_user(0); // Set AA-level and vsync
		event_user(3); // Set fullscreen or windowed
		break;
	
	case 1:
		event_user(1); // Set window size and position (contents will scale to fit with letterbox effect)
		event_user(2); // Set GUI size
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