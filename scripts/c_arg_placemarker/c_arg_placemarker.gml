/// @descr base class for all classes
var method = argument0;
var this = argument1;
var args = argument2;

switch(method)
{
	case constructor:
		this.placemarker = "placemarker";
		return this;
	
	case get_class_info:
		return ok_class_info([
			prop_any("placemarker")
		]);
	
	case test:
		//scr_panic("Tests not implemented!");
		break;
	
	default:
		return refused();
}