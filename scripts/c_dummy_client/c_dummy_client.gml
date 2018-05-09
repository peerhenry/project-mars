var method = argument0;
var this = argument1;
var args = argument2;
var here = c_dummy_client;

switch(method)
{
	case constructor:
		return this;

	case destructor: 
		return ok();

	case get_class_info:
		var interface = borrowed_interface("deppy", [
			prop_method("dummy_serve_method", t_string(), [p_integer("p1"), p_number("p2")])
		]);
		interface.gets_injected = false;
		return ok_class_info([
			interface
		]);
	
	case test:
		break;
	
	default:
		return refused();
}