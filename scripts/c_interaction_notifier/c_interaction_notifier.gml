var method = argument0;
var this = argument1;
var args = argument2;
var here = c_interaction_notifier;

switch(method)
{
	case constructor: // can be remove if not needed
		return this;

	case destructor: 
		return ok();
	
	// methods
	case "execute":
		resolve_execute(global.script_container, "alert_player", "execute interaction");
		return ok();
	
	case test:
		// test_method(here, "mytest");
		break;
	
	default:
		return refused();
}