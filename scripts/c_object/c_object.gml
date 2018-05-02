/// @descr base class for all classes
var method = argument0;
var this = argument1;
var args = argument2;

switch(method)
{
	case constructor:
		return this;

	case destructor:
		return ok();
	
	case get_class_info:
		return ok_class_info([]);
	
	case get_clients:
		return ok(noone);
		
	case get_object_index:
		return ok(obj_empty);
	
	case test:
		//scr_panic("Tests not implemented!");
		break;
	
	default:
		var msg = "Refused request: function not defined: " + method;
		scr_panic(msg);
}