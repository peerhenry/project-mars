var method = argument0;
var this = argument1;
var args = argument2;

switch(method)
{
	case constructor:
		return this;

	case "method1":
		return ok(2*args[0]);
	
	case "method2":
		return ok(2);

	case destructor:
		return ok();
	
	case test:
		break;
	
	default:
		return refused();
}