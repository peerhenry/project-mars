/// @descr base class for all classes
function c_object(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;

	switch(func)
	{
		case constructor:
			return this;

		case destructor:
			return ok();
	
		case get_class_info:
			return exception_skip_standards();
	
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


}
