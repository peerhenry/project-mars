var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_boilerplate; // <=== CHANGE THIS

switch(method)
{
	// params begin at argument[2]
	case constructor: // can be remove if not needed
		return this;

	case get_dependencies:
		return ok(noone);	// return ok(new(c_dependencies, []));

	case destructor: 
		instance_destroy(this);
		break;
	
	// methods
	case "notify_player":
		var msg = argument[2];
		resolve_execute(global.script_container, "alert_player", msg);
		return ok();
	
	case test:
		test_method(here, "mytest");
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