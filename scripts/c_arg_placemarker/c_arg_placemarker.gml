/// @descr base class for all classes
var method = argument0;
var this = argument1;
var args = argument2;

switch(method)
{
	case constructor:
		this.placemarker = "placemarker";
		return this;
	
	case get_interface:
		return new(c_class_info, [
			new(c_class_property, [
				"placemarker", t_any()
			])
		]);
	
	case test:
		//scr_panic("Tests not implemented!");
		break;
	
	default:
		var msg = "Refused request: function not defined: " + method;
		scr_panic(msg);
}