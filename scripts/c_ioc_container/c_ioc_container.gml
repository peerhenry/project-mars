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
		// this.injection_map = ds_map_create(); // client class - injections
		return this;
	
	case destructor:
		ds_map_destroy(this.instances);
		ds_map_destroy(this.class_container);
		instance_destroy(this);
		break;
	#endregion
	
	#region register
	case "register":
		var name = argument[2];
		var class = argument[3];
		this.class_container[? name] = class;
		return ok();
	#endregion
	
	#region register_instance
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
	case "resolve":
		var name = argument[3];
		// Check argument
		var class = this.class_container[? name];
		if(typeof(name) != "string") scr_panic("Cannot resolve: key was not a string!");
		if(is_undefined(class)) scr_panic("Could not resolve: No class registered for: " + name);
		// Check if there's an instance registerd for class
		var instance = this.instances[? class];
		if(!is_undefined(instance)) return ok(instance);
		// Check if there are dependencies
		var deps = in(class, get_dependencies);
		var has_dependencies = is_array(deps) && array_length_1d(deps) > 0;
		if(!has_dependencies)
		{
			destroy(deps);
			instance = new(class);
			return ok(instance);
		}
		// Resolve dependencies
		var dep_names = morph(deps, "get_name");
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
				instance = new(class, resolved_deps[0], resolved_deps[1], resolved_deps[2]);
				break;
			default:
				scr_panic("Too many injections in resolve for " + script_get_name(class));
		}
		return ok(instance);
	#endregion
	
	#region TESTS
	
	case test:
		test_method(here, "test_construct_destruct");
		// todo: test register, resolve
		break;
	
	case "test_construct_destruct":
		var container = new(c_ioc_container);
		var map1 = container.instances;
		var map2 = container.class_container;
		assert_true(ds_exists(map1, ds_type_map), "instances exists");
		assert_true(ds_exists(map2, ds_type_map), "class_container exists");
		destroy(container);
		assert_false(ds_exists(map1, ds_type_map), "instances has been cleaned up");
		assert_false(ds_exists(map2, ds_type_map), "class_container map has been cleaned up");
		break;
	
	#endregion
	
	default:
		return refused();
}