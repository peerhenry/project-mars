var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

// define method names in enum

switch(method)
{
	case OBJECT.NEW:
		return this;

	// methods

	case OBJECT.DESTROY:
		instance_destroy(this);
		break;
	
	case OBJECT.TEST:
		break;
	
	default:
		show_error("Refused request: function not defined", true);
}