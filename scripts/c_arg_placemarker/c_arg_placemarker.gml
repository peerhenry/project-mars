/// @descr base class for all classes
function c_arg_placemarker(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;

	switch(func)
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


}
