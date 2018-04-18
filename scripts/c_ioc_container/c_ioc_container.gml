#region boilerplats
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_ioc_container;
#endregion

switch method
{
	case constructor:
		this.statics = ds_map_create();
		this.injection_map = ds_map_create(); // client class - injections
		this.class_container = ds_map_create(); // string - class
		return this;
	
	case destructor:
		ds_map_destroy(this.injection_map);
		ds_map_destroy(this.statics);
		instance_destroy(this);
		break;
	
	#region METHODS
	
	#region set_injections
	case "set_injections":
		var client = argument[2];
		var injections = argument[3];
		if(!script_exists(client)) scr_panic("Error at register_injections: 1st argument must be a class definition script.");
		if(!is_array(injections)) scr_panic("Error at register_injections: 2nd argument must be an array.");
		this.injection_map[?client] = injections;
		return ok();
	#endregion
	
	#region get_injections
	case "get_injections":
		var client = argument[2];
		var injections = this.injection_map[?client];
		return ok(injections);
	#endregion
	
	#region register_static
	// This makes resolve always return the same instance given here
	case "register_static":
		var instance = argument[2];
		this.statics[? instance.class] = instance;
		return ok();
	#endregion
	
	#region make_static
	// Resolve a class and make it a static instance, so that resolving it in the future will always give the same instance
	case "resolve_set_static":
		var class = argument[2];
		var inst = call_unwrap(this, "resolve", class);
		call_unwrap(this, "register_static", inst);
		return ok();
	#endregion
	
	#region resolve
	case "resolve":
		var class = argument[2];
		var instance = this.statics[?class];
		if(!is_undefined(instance)) return ok(instance);
		var injections = call_unwrap(this, "get_injections", class);
		if(is_undefined(injections) || !is_array(injections))
		{
			instance = new(class);
			return ok(instance);
		}
		var injectables = morph(injections, "resolve");
		switch(array_length_1d(injectables))
		{
			case 1:
				instance = new(class, injectables[0]);
				break;
			case 2:
				instance = new(class, injectables[0], injectables[1]);
				break;
			case 3:
				instance = new(class, injectables[0], injectables[1], injectables[2]);
				break;
			default:
				scr_panic("Too many injections in resolve for " + script_get_name(class));
		}
		return ok(instance);
	#endregion

	#endregion
	
	#region TESTS
	
	case test:
		test_method(here, "test_construct_destruct");
		test_method(here, "test_resolve_no_injections");
		test_method(here, "test_resolve_with_injections");
		break;
	
	case "test_construct_destruct":
		var container = new(c_ioc_container);
		var map1 = container.statics;
		var map2 = container.injection_map;
		assert_true(ds_exists(map1, ds_type_map), "statics exists");
		assert_true(ds_exists(map2, ds_type_map), "injection map exists");
		destroy(container);
		assert_false(ds_exists(map1, ds_type_map), "statics has been cleaned up");
		assert_false(ds_exists(map2, ds_type_map), "injection map has been cleaned up");
		break;
	
	case "test_resolve_no_injections":
		var container = new(c_ioc_container);
		var mocky = call_unwrap(container, "resolve", c_object);
		assert_equal(c_object, mocky.class, "resolved mock has class c_object");
		destroy(mocky);
		destroy(container);
		break;
	
	case "test_resolve_with_injections":
		// arrange
		var container = new(c_ioc_container);
		var intf = interface([["foo", t_void(), t_void()]]);
		var injection = provider(intf);
		call_unwrap(container, "set_injections", c_mock, [injection]);
		// act
		var mocky = call_unwrap(container, "resolve", c_mock);
		// assert
		assert_equal(c_mock, mocky.class, "resolved mock has class c_mock");
		assert_equal(1, array_length_1d(mocky.stubs), "stubs count");
		assert_equal("foo", mocky.stubs[0], "stubs count");
		// cleanup
		instance_destroy(mocky);
		destroy(container);
		destroy(intf);
		destroy(injection);
		break;
	
	#endregion
	
	default:
		return refused();
}