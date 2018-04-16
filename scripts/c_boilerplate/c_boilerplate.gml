var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_boilerplate; // <=== CHANGE THIS

switch(method)
{
	// params begin at argument[2]
	case constructor: // can be remove if not needed
		return this;

	// methods
	// params begin at argument[2]

	// can be remove if not needed
	case destructor: 
		instance_destroy(this);
		break;
	
	case register_dependencies:
		break;
	
	case test:
		break;
	
	default:
		return refused();
}