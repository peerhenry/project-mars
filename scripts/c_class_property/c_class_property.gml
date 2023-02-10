/// @descr Mock class 
function c_class_property(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_class_property;

	switch(func)
	{
		case constructor:
			this.name = args[0];
			this.type_info = args[1];
			this.is_borrowed = true;
			this.gets_injected = true;
			return this;

		case destructor:
			destroy(this.type_info);
			return ok();
	
		case get_class_info:
			return ok_class_info([
				prop_string("name"),
				owned_object("type_info", obj_type_info),
				prop_bool("is_borrowed", NOT_INJECTED),
				prop_bool("gets_injected", NOT_INJECTED)
			]);
	
		case "copy":
			var info_copy = uvoid(this.type_info, "copy");
			var copy = fnew(c_class_property, [this.name, info_copy]);
			copy.is_borrowed = this.is_borrowed;
			copy.gets_injected = this.gets_injected;
			return ok(copy);
	
		case test:
			break;
	
		default:
			return refused();
	}


}
