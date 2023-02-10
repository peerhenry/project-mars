function c_parameter_consumer(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_parameter_consumer;

	switch(func)
	{
		case constructor: // can be remove if not needed
			return this;

		case destructor: 
			return ok();

		case get_class_info:
			var consume_param = p_object("p1", obj_empty);
			consume_param.is_consumed = true;
			return ok_class_info([
				prop_method("consume_object", t_void(), consume_param),
				prop_method("do_not_consume", t_void(), p_object("p1", obj_empty))
			]);
	
		// array of tuples containing class and dependency name
		case get_clients:
			return ok(noone);
	
		// methods
		case "consume_object":
			instance_destroy(args[0]);
			return ok();
		
		case "do_not_consume":
			return ok();
	
		case test:
			break;

		default:
			return refused();
	}


}
