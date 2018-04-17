/// @descr base class for all classes
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

switch(method)
{
	case constructor:
		return this;

	case destructor:
		instance_destroy(this);
		break;
	
	case test:
		scr_panic("Tests not implemented!");
		break;
	
	default:
		scr_panic("Refused request: function not defined");
}