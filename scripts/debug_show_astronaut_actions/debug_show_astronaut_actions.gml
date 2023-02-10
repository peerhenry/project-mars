function debug_show_astronaut_actions() {
	with(obj_astronaut)
	{
		show_debug_message("current action: " + string(current_action));
	}


}
