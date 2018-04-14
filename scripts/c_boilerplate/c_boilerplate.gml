var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

switch(method)
{
	// params begin at argument[2]
	case constructor:
		return this;

	// methods
	// params begin at argument[2]

	case destructor:
		instance_destroy(this);
		break;
	
	case test:
		break;
	
	default:
		return refused();
}