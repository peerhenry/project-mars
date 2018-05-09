var method = argument0;
var this = argument1;
var args = argument2;
var here = c_method_info;

switch(method)
{
	#region constructor
	
	case constructor: // can be remove if not needed
		this.parameters = [];
		this.type = TYPE.METHOD;
		var count = scr_length(args);
		if(count > 0)
		{
			this.return_type_info = args[0];
			if(count > 1)
			{
				var arg_info = args[1];
				if(!is_array(arg_info))
				{
					arg_info = [arg_info];
				}
				this.parameters = arg_info;
			}
		}
		else this.return_type_info = t_void();
		return this;

	case get_class_info:
		return ok_class_info([
			owned_object("return_type_info", obj_type_info),
			prop_array("parameters")
		]);

	case destructor:
		destroy(this.return_type_info);
		map_script(this.parameters, destroy);
		return ok();

	#endregion constructor
	
	#region methods
	
	case "create_dummy":
		// hmm, does this have any purpose here??
		return ok();
	
	case "assert_match":
		var other_meth_info = args[0];
		call_unwrap(this.return_type_info, "assert_match", other_meth_info.return_type_info);
		var pass = assert_equal(scr_length(this.parameters),  scr_length(other_meth_info.parameters), "c_method_info assert_match: parameter count");
		if(!pass) return ok(); // not gonna try to match arguments if their lengths don't match
		for(var n = 0; n < scr_length(this.parameters); n++)
		{
			var next_param = this.parameters[n];
			var other_param = other_meth_info.parameters[n];
			assert_equal(next_param.name, other_param.name, "parameter name");
			call_unwrap(next_param.type_info, "assert_match", other_param.type_info);
		}
		return ok();
		
	case "private_param_to_dummy":
		var param = args[0];
		var dummy = void_unwrap(param.type_info, "create_dummy");
		return ok(dummy);
	
	case "assert_arguments":
		var argus = args;
		for(var n = 0; n < scr_length(argus); n++)
		{
			var next_param = this.parameters[n];
			call_unwrap(next_param.type_info, "assert_type", argus[n]);
		}
		return ok();
		
	case "private_cleanup_thing":
		var thing = args[0];
		var type_info = args[1];
		if(type_info.type == TYPE.OBJECT) instance_destroy(thing);
		else if(type_info.type == TYPE.LIST) ds_list_destroy(thing);
		else if(type_info.type == TYPE.MAP) ds_map_destroy(thing);
		return ok();
	
	case "assert_type": // given an instance and a method, does it respond to giver arguments - and does it return a proper type
		var instance = args[0];
		var method = args[1];
		var dummy_args = map_method(this.parameters, this, "private_param_to_dummy");
		var returned = call_unwrap(instance, method, dummy_args);
		call_unwrap(this.return_type_info, "assert_type", returned);
		// cleanup
		call_unwrap(this, "private_cleanup_thing", [returned, this.return_type_info]);
		for(var n = 0; n < scr_length(dummy_args); n++)
		{
			var param = this.parameters[n];
			var argu = dummy_args[n];
			call_unwrap(this, "private_cleanup_thing", [argu, param.type_info]);
		}
		return ok();
	
	#endregion
	
	#region tests
	
	case test:
		test_method(here, "test_construct");
		test_method(here, "test_factory");
		test_method(here, "test_construct_parameters");
		test_method(here, "test_assert_match");
		test_method(here, "test_private_param_to_dummy");
		test_method(here, "test_assert_type");
		break;
	
	case "test_construct":
		// setup
		var thing = new(c_method_info, t_string());
		// assert
		assert_equal(0, scr_length(thing.parameters), "parameters length");
		assert_equal(TYPE.STRING, thing.return_type_info.type, "return_type_info");
		// cleanup
		destroy(thing);
		break;
	
	case "test_factory":
		var meth = t_method();
		assert_equal(TYPE.VOID, meth.return_type_info.type, "return type is void");
		destroy(meth);
		
		var meth2 = t_method(t_number());
		assert_equal(TYPE.NUMBER, meth2 .return_type_info.type, "return type is number");
		destroy(meth2);
		break;
	
	case "test_construct_parameters":
		// setup
		var thing = new(c_method_info, [
			t_void(), 
			[p_number("d1"), p_string("d2"), p_object("d3", obj_empty)]
		]);
		// assert
		assert_equal(3, scr_length(thing.parameters), "parameters length");
		assert_equal(TYPE.VOID, thing.return_type_info.type, "return_type_info");
		var p3 = thing.parameters[2];
		assert_equal("d3", p3.name, "last parameter name");
		assert_equal(TYPE.OBJECT, p3.type_info.type, "last parameter type");
		// cleanup
		destroy(thing);
		break;
	
	case "test_assert_match":
		// setup
		var substrate = new(c_method_info, [
			t_void(), 
			[p_number("d1"), p_string("d2"), p_object("d3", obj_empty)]
		]);
		var thing = new(c_method_info, [
			t_void(), 
			[p_number("d1"), p_string("d2"), p_object("d3", obj_empty)]
		]);
		// assert
		call_unwrap(substrate, "assert_match", thing);
		// cleanup
		destroy(substrate);
		destroy(thing);
		break;
	
	case "test_private_param_to_dummy":
		// setup
		var param = new(c_parameter, ["sam", t_object(obj_empty)]);
		// act
		var thing = call_static_unwrap(here, "private_param_to_dummy", param);
		// assert
		assert_true(instance_exists(thing), "thing is an object");
		call_unwrap(param.type_info, "assert_type", thing);
		// cleanup
		destroy(param);
		instance_destroy(thing);
		break;
	
	case "test_assert_type":
		var meth_info = new(c_method_info, [
			t_void(), 
			[p_number("d1"), p_string("d2"), p_object("d3", obj_empty)]
		]);
		var mocky = new(c_mock);
		show_debug_message("1 obj_empty count: " + string(scr_count_instances(obj_empty)));
		var prop = new(c_class_property, ["foo", meth_info]);
		show_debug_message("2 obj_empty count: " + string(scr_count_instances(obj_empty)));
		call_unwrap(mocky, "add_prop", prop);
		show_debug_message("3 obj_empty count: " + string(scr_count_instances(obj_empty)));
		// assert
		call_unwrap(meth_info, "assert_type", [mocky, "foo"]);
		show_debug_message("4 obj_empty count: " + string(scr_count_instances(obj_empty)));
		// cleanup
		destroy(mocky);
		show_debug_message("5 obj_empty count: " + string(scr_count_instances(obj_empty)));
		destroy(prop);
		show_debug_message("6 obj_empty count: " + string(scr_count_instances(obj_empty)));
		break;
	
	#endregion
	
	default:
		return refused();
}