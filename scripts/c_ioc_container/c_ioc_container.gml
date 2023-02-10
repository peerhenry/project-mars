function c_ioc_container(argument0, argument1, argument2) {
#region boilerplate
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_ioc_container;
#endregion

	switch func
	{
	#region Constructor/destructor
		case constructor:
			this.instances = ds_map_create();
			this.class_container = ds_map_create(); // string - class
			this.resolvings = ds_list_create();
			return this;
	
		case get_class_info:
			return ok_class_info([
				owned_map("instances", NOT_INJECTED),
				owned_map("class_container", NOT_INJECTED),
				owned_list("resolvings", NOT_INJECTED)
			]);
		
		case get_object_index:
			return ok(obj_ioc_container);
	
		case destructor:
			ds_map_destroy(this.instances);
			ds_map_destroy(this.class_container);
			void_unwrap(this, "clear_resolvings");
			ds_list_destroy(this.resolvings);
			return ok();
	
		case "clear_resolvings":
			foreach(this.resolvings, this, "destroy_resolving");
			ds_list_clear(this.resolvings);
			return ok();
	
		case "destroy_resolving":
			var res = args[0];
			if(instance_exists(res))
			{
				destroy(res);
			}
			return ok();
	#endregion
	
	#region register
		case "register":
			var name = args[0];
			var class = args[1];
			this.class_container[? name] = class;
			return ok();

		case "register_instance":
			var name = args[0];
			var instance = args[1];
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
			var class = args[0];
			var inj_names = args[1];
			var resolved_deps = map_method(inj_names, this, "resolve");
			instance = fnew(class, resolved_deps);
			return ok(instance);
	
		case "resolve":
			var name = args[0];
			// Check argument
			var class = this.class_container[? name];
			if(typeof(name) != "string") return result_error("Cannot resolve: key was not a string!");
			if(is_undefined(class)) return exception("Could not resolve: No class registered for: " + name);
			// Check if there's an instance registerd for class
			var instance = this.instances[? class];
			if(!is_undefined(instance)) return ok(instance);
			// Check if there are dependencies
			var inj_names = scr_get_injection_names(class);
			var has_dependencies = scr_length(inj_names) > 0;
			if(!has_dependencies)
			{
				instance = fnew(class);
			}
			else instance = call_unwrap(this, "resolve_with_dependencies", [class, inj_names]);
			ds_list_add(this.resolvings, instance);
			return ok(instance);
	#endregion
	
	#region TESTS
	
		case test:
			test_method(here, "test_construct_destruct");
			test_method(here, "test_register_resolve");
			break;
	
		case "test_construct_destruct":
			var container = fnew(c_ioc_container);
			var map1 = container.instances;
			var map2 = container.class_container;
			assert_true(ds_exists(map1, ds_type_map), "instances exists");
			assert_true(ds_exists(map2, ds_type_map), "class_container exists");
			destroy(container);
			assert_false(ds_exists(map1, ds_type_map), "instances has been cleaned up");
			assert_false(ds_exists(map2, ds_type_map), "class_container map has been cleaned up");
			break;
	
		case "test_register_resolve":
			show_debug_message("1 eyo:" + string(scr_count_instances(obj_result)));
			var container = fnew(c_ioc_container);
			show_debug_message("2 eyo:" + string(scr_count_instances(obj_result)));
			call_unwrap(container, "register", ["dummy", c_object]);
			show_debug_message("3 eyo:" + string(scr_count_instances(obj_result)));
			var result = call_unwrap(container, "resolve", "dummy");
			show_debug_message("4 eyo:" + string(scr_count_instances(obj_result)));
			assert_equal(c_object, result.class, "resolved class");
			show_debug_message("5 eyo:" + string(scr_count_instances(obj_result)));
			destroy(result);
			show_debug_message("6 eyo:" + string(scr_count_instances(obj_result)));
			destroy(container);
			show_debug_message("7 eyo:" + string(scr_count_instances(obj_result)));
			break;
	
	#endregion
	
		default:
			return refused();
	}


}
