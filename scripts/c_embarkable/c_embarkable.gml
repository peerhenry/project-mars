#region set here, method and this
var here = c_embarkable;
var method = argument0;
var this = argument1;
var args = argument2;
#endregion

switch(method)
{
	case constructor:
		this.appear_setter = args[0];
		this.capacity = args[1];
		this.embarked_astronauts = ds_list_create();
		this.full_message = "Astronaut cannot embark; embarkable is full";
		return this;
	
	case destructor:
		ds_list_destroy(this.embarked_astronauts);
		return ok();
	
	case get_class_info:
		return ok_class_info([
			prop_interface("appear_setter", [
				prop_method("disappear", t_void(), p_object("astro", obj_astronaut)),
				prop_method("reappear", t_void(), p_object("astro", obj_astronaut))
			]),
			prop_integer("capacity"),
			owned_list("embarked_astronauts", NOT_INJECTED),
			prop_string("full_message", NOT_INJECTED),
			
			prop_method("embark", t_void(), p_object("arg_astronaut", obj_astronaut)),
			prop_method_throws("disembark", t_void(), p_object("arg_astronaut", obj_astronaut))
		]);
	
	case get_clients:
		// todo: depend on the interaction_factory without being a constructor injection
		return ok(noone);
	
	#region METHODS
	case "disembark":
		var arg_astronaut = args[0];
		var index = ds_list_find_index(this.embarked_astronauts, arg_astronaut);
		if(index >= 0)
		{
			ds_list_delete(this.embarked_astronauts, arg_astronaut);
			var result = call(this.appear_setter, "reappear", arg_astronaut);
			return result;
		}
		return exception("Astronaut could not disembark: it was not embarked.");

	case "embark":
		var arg_astronaut = args[0];
		if(ds_list_size(this.embarked_astronauts) < this.capacity)
		{
			ds_list_add(this.embarked_astronauts, arg_astronaut);
			call_unwrap(this.appear_setter, "disappear", arg_astronaut);
			return ok();
		}
		else return exception(this.full_message);
	#endregion
	
	#region UNIT TESTS
	
	case test:
		test_method(here, "disembark_test");
		test_method(here, "embark_test");
		test_method(here, "embark_atm_is_full");
		break;
	
	case "disembark_test":
		// setup
		var object = setup_testable(here);
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		call_unwrap(object, "embark", astro);
		// act
		call_unwrap(object, "disembark", astro);
		// assert
		mock_verify(mock_setter, "reappear", Times.Once); // in mock_setter, verify that stub for "reappear" has been called once
		// cleanup
		instance_destroy(astro);
		cleanup_testable(object);
		break;
	
	case "embark_test":
		// setup
		var object = setup_testable(here);
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		// act
		call_unwrap(object, "embark", astro);
		// assert
		mock_verify(mock_setter, "disappear", Times.Once);
		// cleanup
		instance_destroy(astro);
		cleanup_testable(object);
		break;
	
	case "embark_atm_is_full":
		// setup
		var object = setup_testable(here);
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		ds_list_add(object.embarked_astronauts, 13);
		ds_list_add(object.embarked_astronauts, 14);
		ds_list_add(object.embarked_astronauts, 15);
		// act
		var result = call(object, "embark", astro);
		// assert
		mock_verify(mock_setter, "disappear", Times.Never);
		assert_equal(STATUS.PROBLEM, result.status, "status");
		assert_equal(PROBLEM.EXCEPTION, result.value, "problem");
		// cleanup
		instance_destroy(astro);
		cleanup_testable(object);
		destroy(result);
		break;
	
	#endregion
	
	default:
		return refused();
}