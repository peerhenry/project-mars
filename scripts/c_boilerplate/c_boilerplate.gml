var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

switch(method)
{
	case constructor:
		return this;

	// methods

	case "destroy":
		instance_destroy(this);
		break;
	
	case "test":
		break;
	
	default:
		show_error("Refused request: function not defined", true);
}