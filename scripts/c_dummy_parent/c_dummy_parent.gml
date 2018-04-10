var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

switch(method)
{
	case constructor:
		return this;

	case "method1":
		return 2*argument[2];
	
	case "method2":
		return 2;

	case destructor:
		instance_destroy(this);
		break;
	
	case test:
		break;
	
	default:
		show_error("Refused request: function not defined", true);
}