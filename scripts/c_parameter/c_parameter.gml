var method = argument0;
var this = argument1;
var args = argument2;
var here = c_parameter;

switch(method)
{
	case constructor:
		this.name = args[0];
		this.type_info = args[1];
		this.is_consumed = false;
		return this;

	case destructor: 
		return ok();
	
	case get_class_info:
		return ok_class_info([
			prop_string("name"),
			prop_object("type_info", obj_type_info),
			prop_bool("is_consumed", NOT_INJECTED)
		]);
	
	// methods
	
	case test:
		break;
	
	default:
		return refused();
}