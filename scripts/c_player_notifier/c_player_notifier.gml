var method = argument0;
var this = argument1;
var args = argument2;
var here = c_player_notifier;

switch(method)
{
	case constructor: // can be remove if not needed
		return this;

	/*
	case get_dependencies:
		return ok(noone);	// return ok(new(c_dependencies, []));
		*/

	case get_class_info:
		return ok_class_info([]);
	
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
		//test_method(here, "mytest");
		break;
	
	case "mytest":
		// arrange
		var tup = setup_testable(here);
		var testable = tup.item0;
		// act
		// assert
		// cleanup
		cleanup_testable(tup);
		break;
	
	default:
		return refused();
}