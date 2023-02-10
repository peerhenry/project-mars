function c_parameter(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_parameter;

	switch(func)
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
	
		case "copy":
			var info_copy = uvoid(this.type_info, "copy");
			var copy = fnew(here, [this.name, info_copy]);
			copy.is_consumed = this.is_consumed;
			return ok(copy);
	
		case test:
			break;
	
		default:
			return refused();
	}


}
