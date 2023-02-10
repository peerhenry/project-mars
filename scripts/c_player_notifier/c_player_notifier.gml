function c_player_notifier(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_player_notifier;

	switch(func)
	{
		case constructor: // can be remove if not needed
			return this;

		/*
		case get_dependencies:
			return ok(noone);	// return ok(new(c_dependencies, []));
			*/

		case get_class_info:
			return ok_class_info([
				prop_method("notify_player", t_void(), p_string("msg"))
			]);
	
		case get_clients:
			var clients = [];
			return ok(clients);
	
		// methods
		case "notify_player":
			var msg = args[0];
			resolve_execute(global.script_container, "alert_player", msg);
			return ok();
	
		case test:
			test_nyi(here);
			break;
	
		default:
			return refused();
	}


}
