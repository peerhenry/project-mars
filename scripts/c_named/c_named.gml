var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_named;

switch(method)
{
	// params begin at argument[2]
	case constructor: // can be remove if not needed
		this.name = argument[2];
		this.value = argument[3];
		return this;

	case "get_name":
		return ok(this.name);
	
	case "get_value":
		return ok(this.value);
	
	case get_dependencies:
		return noone;

	case destructor: 
		instance_destroy(this);
		break;
	
	case test:
		break;
	
	default:
		return refused();
}