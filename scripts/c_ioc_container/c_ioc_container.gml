#region boilerplats
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_ioc_container;
#endregion

switch method
{
	#region Constructor/destructor
	case constructor:
		this.instances = ds_map_create();
		this.class_container = ds_map_create(); // string - class
		this.resolvings = ds_list_create();
		return this;
	
	case "destroy_resolving":
		var res = argument[2];
		if(instance_exists(res))
		{
			destroy(res);
		}
		return ok();
	
	case "clear_resolvings":
		foreach(this.resolvings, this, "destroy_resolving");
		return ok();
	
	case destructor:
		ds_map_destroy(this.instances);
		ds_map_destroy(this.class_container);
		call_unwrap(this, "clear_resolvings");
		ds_list_destroy(this.resolvings);
		instance_destroy(this);
		break;
	#endregion
	
	#region register
	case "register":
		var name = argument[2];
		var class = argument[3];
		this.class_container[? name] = class;
		return ok();

	case "register_instance":
		var name = argument[2];
		var instance = argument[3];
		// register class
		var existing = this.class_container[? name];
		if(is_undefined(existing)) this.class_container[? name] = instance.class;
		else if(existing != instance.class) scr_panic("Register instance conflict: " + name + ". instance class: " + script_get_name(instance.class) + ", existing class: " + script_get_name(existing));
		// register instance
		this.instances[? instance.class] = instance;
		return ok();
	#endregion
	
	#region resolve
	case "resolve_with_dependencies":
		// Resolve dependencies
		var class = argument[2];
		var deps = argument[3];
		var d_names_list = scr_from_select(deps.list, "name");
		var dep_names = scr_list_to_array(d_names_list);
		ds_list_destroy(d_names_list);
		var resolved_deps = map_method(dep_names, this, "resolve");
		destroy(deps);
		// Inject dependencies
		switch(array_length_1d(resolved_deps))
		{
			case 1:
				instance = new(class, resolved_deps[0]);
				break;
			case 2:
				instance = new(class, resolved_deps[0], resolved_deps[1]);
				break;
			case 3:
				instance = new(class, resolved_deps[0], resolved_deps[1], resolved_deps[2]);
				break;
			case 4:
				instance = new(class, resolved_deps[0], resolved_deps[1], resolved_deps[2], resolved_deps[3]);
				break;
			default:
				scr_panic("Too many injections in resolve for " + script_get_name(class));
		}
		return ok(instance);
	
	case "resolve":
		var name = argument[2];
		// Check argument
		var class = this.class_container[? name];
		if(typeof(name) != "string") scr_panic("Cannot resolve: key was not a string!");
		if(is_undefined(class)) return exception("Could not resolve: No class registered for: " + name);
		// Check if there's an instance registerd for class
		var instance = this.instances[? class];
		if(!is_undefined(instance)) return ok(instance);
		// Check if there are dependencies
		var deps = call_static_unwrap(class, get_dependencies);
		var has_dependencies = deps != noone;
		if(!has_dependencies)
		{
			instance = new(class);
		}
		else instance = call_unwrap(this, "resolve_with_dependencies", class, deps);
		ds_list_add(this.resolvings, instance);
		return ok(instance);
	
	case "unresolve":
		var instance = argument[2];
		var existing = this.instances[? instance.class];
		if(is_undefined(existing)) destroy(instance); // destroy if it's not a static instance
		return ok();
	#endregion
	
	#region TESTS
	
	case test:
		test_method(here, "test_construct_destruct");
		// todo: test register, resolve
		break;
	
	case "test_construct_destruct":
		var container = new_override(c_ioc_container, obj_ioc_container);
		var map1 = container.instances;
		var map2 = container.class_container;
		assert_true(ds_exists(map1, ds_type_map), "instances exists");
		assert_true(ds_exists(map2, ds_type_map), "class_container exists");
		destroy(container);
		assert_false(ds_exists(map1, ds_type_map), "instances has been cleaned up");
		assert_false(ds_exists(map2, ds_type_map), "class_container map has been cleaned up");
		break;
	
	case "test_register_resolve":
		var container = new_override(c_ioc_container, obj_ioc_container);
		call_unwrap(container, "register", "dummy", c_tuple);
		var result = call_unwrap(container, "resolve", "dummy");
		assert_equal(c_tuple, result.class, "resolved class");
		destroy(result);
		destroy(container);
		break;
	
	#endregion
	
	default:
		return refused();
}