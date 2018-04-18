var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_atm_interaction;

// todo:
// - set this class as end_path_action in astronaut in the click event
// - call the end path action
// - get interface somehow, and test that it can serve the dependency
// - put this class in test_classes
// - test that embarker can serve this

switch(method)
{
	case constructor:
		this.embarker = argument[2];
		this.atm = argument[3];
		this.notifier = argument[4];
		return this;

	case "execute":
		var entity = argument[2];
		var result = call(this.embarker, "embark", this.atm, entity);
		if(result.status == STATUS.OK) return ok();
		else call(this.notifier, "notify_player", result.message);
		break;

	case destructor: 
		instance_destroy(this);
		break;
	
	case register_dependencies: // For interface testing
		set_dependency(here, "embarker", interface([
			"embark", t_void
		]));
		break;
	
	case test:
		// interaction must be an end path action, so it must be able to serve... movable @ end path?
		// then where does its interface go?
		break;
	
	default:
		return refused();
}