/// @descr Mock class 
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_interface;

switch(method)
{
	case constructor:
		var arg_count = scr_length(args);
		this.props = args;
		// todo: filter constructor arguments
		this.prop_map = ds_map_create();
		map_method(this.props, this, "private_add_to_prop_map");
		return this;

	case destructor:
		map_script(this.props, destroy);
		ds_map_destroy(this.prop_map);
		return ok();
	
	case "private_add_to_prop_map":
		var prop = args[0];
		this.prop_map[? prop.name] = prop;
		return ok();
	
	// should be on type_info
	case "get_dummy_value":
		//var m = mock(this); // mock gets ownership of the interface
		return ok();

	case "get_injection_args":
		var data = [];
		var head = 0;
		for(var n = 0; n < array_length_1d(this.props); n++)
		{
			var this_prop = this.props[n];
			if(this_prop.type_info.type != TYPE.METHOD) data[head++] = this_prop;
		}
		return ok(args);
	
	case "get_data_props":
		var data = [];
		var head = 0;
		for(var n = 0; n < array_length_1d(this.props); n++)
		{
			var this_prop = this.props[n];
			if(this_prop.type_info.type != TYPE.METHOD) data[head++] = this_prop;
		}
		return ok(data);
	
	case "extract_dependency":
		// go over props and methods, filter interfaces, get the interface that matches name
		
		break; //	returns an interface
	
	// should be on type_info
	case "assert_type":
		var bigger_intf = args[0];
		for(var n = 0; n < array_length_1d(this.props); n++)
		{
			var this_prop = this.props[n];
			var other_prop = bigger_intf.prop_map[? this_prop.name];
			var prop_exists = !is_undefined(other_prop);
			assert_true(prop_exists, "prop_exists: " + this_prop.name);
			if(prop_exists)
			{
				// match types
				call_unwrap(this_prop.type_info, "assert_match", other_prop.type_info);
			}
		}
		return ok();
	
	case test:
		test_method(here, "test_constructor_empty");
		test_method(here, "test_constructor");
		test_method(here, "test_get_data_props");
		test_method(here, "test_extract_dependency");
		test_method(here, "test_get_dummy_value");
		test_method(here, "test_assert_type");
		break;
	
	case "test_constructor_empty":
		var thing = new(c_interface, []); // array of props;
		destroy(thing);
		break;
	
	case "test_constructor":
		var thing = new(c_interface, [
			new(c_interface_property, ["dummy_number", t_number()])
		]);
		assert_equal(1, scr_length(thing.props), "props length");
		destroy(thing);
		break;
	
	case "test_get_data_props":
		var dummy_number = "dummy_number";
		var thing = new(c_interface, [
			new(c_interface_property, [dummy_number, t_number()]),
			new(c_interface_property, ["dummy_method", new(c_method)])
		]);
		// act
		var data = void_unwrap(thing, "get_data_props");
		// assert
		assert_equal(1, scr_length(data), "props length");
		assert_equal(dummy_number, data[0].name, "prop[0] name");
		// cleanup
		destroy(thing);
		break;
		
	case "test_extract_dependency":
		break;
		
	case "test_get_dummy_value":
		break;
	
	case "test_assert_type":
		break;
	
	default:
		return refused();
}