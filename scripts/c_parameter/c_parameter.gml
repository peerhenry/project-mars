var method = argument0;
var this = argument1;
var args = argument2;
var here = c_parameter;

switch(method)
{
	case constructor:
		this.name = args[0];
		this.type_info = args[1];
		this.owned = false;
		return this;

	case destructor: 
		return ok();
	
	// methods
	
	case test:
		break;
	
	default:
		return refused();
}