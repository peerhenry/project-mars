/// @descr Mock class 
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_class_info;

switch(method)
{
	#region constructor
	case constructor:
		var arg_count = scr_length(args);
		this.props = args;
		// todo: filter constructor arguments
		this.props_map = ds_map_create();
		map_method(this.props, this, "private_add_to_props_map");
		this.type = TYPE.INTERFACE;
		this.is_on_heap = true;
		return this;

	case destructor:
		map_script(this.props, destroy);
		ds_map_destroy(this.props_map);
		return ok();

	case "private_add_to_props_map":
		var prop = args[0];
		var name = prop.name;
		this.props_map[? name] = prop;
		return ok();
	#endregion

	#region methods
	case "copy":
		var copied_props = morph(this.props, "copy");
		var copy = new(here, copied_props);
		return ok(copy);
	
	case "create_dummy":
		var m = new(c_mock, this);
		return ok(m);

	case "prop_is_injection":
		var prop = args[0];
		var inj = prop.type_info.type != TYPE.METHOD && prop.gets_injected;
		return ok(inj);

	case "get_injected_props":
		var data = scr_where(this.props, this, "prop_is_injection");
		return ok(data);
	
	case "get_injection_names":
		var names = scr_from_select_where(this.props, "name", this, "prop_is_injection");
		return ok(names);

	case "get_data_props":
		var data = [];
		var head = 0;
		for(var n = 0; n < array_length_1d(this.props); n++)
		{
			var this_prop = this.props[n];
			if(this_prop.type_info.type != TYPE.METHOD) data[head++] = this_prop;
		}
		return ok(data);
	
	case "get_method_props":
		var meths = [];
		var head = 0;
		for(var n = 0; n < array_length_1d(this.props); n++)
		{
			var this_prop = this.props[n];
			if(this_prop.type_info.type == TYPE.METHOD) meths[head++] = this_prop;
		}
		return ok(meths);
	
	case "extract_dependency":
		// go over props and methods, filter interfaces, get the interface that matches name
		var name = args[0];
		var thing = scr_find_first(this.props, "name", name);
		if(thing != noone) return ok(thing.type_info);
		// try method arguments
		var props_methods = void_unwrap(this, "get_method_props");
		// foreach method, loop over arguments
		for(var n = 0; n < array_length_1d(props_methods); n++)
		{
			var prop = props_methods[n];
			var method_info = prop.type_info;
			var param = scr_find_first(method_info.parameters, "name", name);
			if(param != noone) return ok(param.type_info);
		}
		return ok(noone); // dependency not found
	
	case "assert_match":
		var bigger_intf = args[0];
		for(var n = 0; n < array_length_1d(this.props); n++)
		{
			var this_prop = this.props[n];
			var other_prop = bigger_intf.props_map[? this_prop.name];
			var prop_exists = !is_undefined(other_prop);
			assert_true(prop_exists, "prop_exists: " + this_prop.name);
			if(prop_exists) // prop types should match
			{
				call_unwrap(this_prop.type_info, "assert_match", other_prop.type_info);
			}
		}
		return ok();
	
	case "assert_type":
		var instance = args[0];
		for(var n = 0; n < array_length_1d(this.props); n++)
		{
			var prop = this.props[n];
			if(prop.type_info.type != TYPE.METHOD)
			{
				var exists = assert_true(variable_instance_exists(instance, prop.name), "instance variable exists");
				if(exists) call_unwrap(prop.type_info, "assert_type", variable_instance_get(instance, prop.name));
			}
			else
			{
				call_unwrap(prop.type_info, "assert_type", [instance, prop.name]);
			}
		}
		return ok();
	
	case "to_string":
		return ok("interface");
	#endregion
	
	#region tests
	case test:
		test_method(here, "test_constructor_empty");
		test_method(here, "test_constructor");
		test_method(here, "test_get_data_props");
		test_method(here, "test_get_method_props");
		test_method(here, "test_extract_dependency");
		test_method(here, "test_extract_dependency_from_method");
		test_method(here, "test_create_dummy");
		test_method(here, "test_assert_type");
		break;
	
	case "test_constructor_empty":
		var thing = new(c_class_info);
		destroy(thing);
		break;
	
	case "test_constructor":
		var thing = new(c_class_info, [
			new(c_class_property, ["dummy_number", t_number()])
		]);
		assert_equal(1, scr_length(thing.props), "props length");
		destroy(thing);
		break;
	
	case "test_get_data_props":
		var dummy_number = "dummy_number";
		var thing = new(c_class_info, [
			new(c_class_property, [dummy_number, t_number()]),
			new(c_class_property, ["dummy_method", new(c_method_info)])
		]);
		// act
		var data = void_unwrap(thing, "get_data_props");
		// assert
		assert_equal(1, scr_length(data), "props length");
		assert_equal(dummy_number, data[0].name, "prop[0] name");
		// cleanup
		destroy(thing);
		break;
		
	case "test_get_method_props":
		var dummy_number = "dummy_number";
		var dummy_meth = "dummy_meth";
		var thing = new(c_class_info, [
			new(c_class_property, [dummy_number, t_number()]),
			new(c_class_property, [dummy_meth, new(c_method_info)])
		]);
		// act
		var meths = void_unwrap(thing, "get_method_props");
		// assert
		assert_equal(1, scr_length(meths), "props length");
		assert_equal(dummy_meth, meths[0].name, "method name");
		// cleanup
		destroy(thing);
		break;
		
	// dependency as an instance parameter
	case "test_extract_dependency":
		var dep_name = "deppy";
		var expect = new(c_class_info);
		var thing = new(c_class_info, [
			new(c_class_property, [dep_name, expect])
		]);
		// act
		var intf = call_unwrap(thing, "extract_dependency", dep_name);
		// assert
		assert_equal(expect, intf, "interface");
		// cleanup
		destroy(thing);
		break;
	
	// dependency as a method argument
	case "test_extract_dependency_from_method":
		var dep_name = "deppy";
		var expect = new(c_class_info);
		var thing = new(c_class_info, [
			prop_method("foo", t_void(), new(c_parameter, [dep_name, expect])) 
		]);
		// assert setup
		var prop = thing.props[0];
		var method_info = prop.type_info;
		var param = scr_find_first(method_info.parameters, "name", dep_name);
		assert_true(param != noone, "param != noone");
		assert_true(param.type_info != noone, "param.type_info != noone");
		assert_equal(expect, param.type_info, "parameter type_info is as expected in setup");
		// act
		var intf = call_unwrap(thing, "extract_dependency", dep_name);
		// assert
		assert_equal(expect, intf, "interface");
		// cleanup
		destroy(expect);
		destroy(thing);
		break;
		
	case "test_create_dummy":
		var method_info = new(c_method_info, [ 
			t_void(), 
			new(c_parameter, [
				"dep_name", 
				t_number()
			])
		]);
		var thing = new(c_class_info, [
			new(c_class_property, ["foo", method_info]),
			new(c_class_property, ["numby", t_number()])
		]);
		// act
		var mocky = void_unwrap(thing, "create_dummy");
		// assert
		assert_equal(c_mock, mocky.class, "dummy class");
		assert_true(variable_instance_exists(mocky, "numby"), "mocky has numby");
		// cleanup
		destroy(mocky);
		destroy(thing);
		break;
	
	case "test_assert_match":
		var match_prop = "nilly";
		var thing = new(c_class_info, [
			new(c_class_property, [match_prop, t_number()])
		]);
		var bigger = new(c_class_info, [
			new(c_class_property, [match_prop, t_number()]),
			new(c_class_property, ["something else", t_string()])
		]);
		// act/assert
		call_unwrap(thing, "assert_match", bigger);
		// cleanup
		destroy(thing);
		destroy(bigger);
		break;
	
	case "test_assert_type":
		var thing = new(c_class_info, [
			new(c_class_property, ["billy", t_number()]),
			new(c_class_property, ["something else", t_string()])
		]);
		var mocky = new(c_mock, thing);
		// assert
		call_unwrap(thing, "assert_type", mocky); // assert mocky implements the interface
		// cleanup
		destroy(mocky);
		destroy(thing);
		break;
		
	#endregion tests
	
	default:
		return refused();
}