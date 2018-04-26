#region set here, method and this
var here = c_atm_embarker;
var method = argument0;
var this = argument1;
var args = argument2;
#endregion

switch(method)
{
	case constructor:
		this.appear_setter = args[0];
		return this;
	
	case get_dependencies:
		var deps = new(c_dependencies, [
			new_interface("appear_setter", [
				signature("disappear", t_void(), t_object(obj_astronaut)),
				signature("reappear", t_void(), t_object(obj_astronaut))
			])
		]);
		return ok(deps);
	
	case get_clients:
		var client_array = [ tuple(c_interaction_factory, "embarker") ]; // this class serves interaction factory as embarker
		return ok(client_array);
	
	#region METHODS
	case "disembark":
		var arg_atm = args[0];
		var arg_astronaut = args[1];
		var index = ds_list_find_index(arg_atm.embarked_astronauts, arg_astronaut);
		if(index >= 0)
		{
			ds_list_delete(arg_atm.embarked_astronauts, arg_astronaut);
			var result = call(this.appear_setter, "reappear", arg_astronaut);
			return result;
		}
		return exception("Astronaut was not in ATM.");

	case "embark":
		var arg_atm = args[0];
		var arg_astronaut = args[1];
		if(ds_list_size(arg_atm.embarked_astronauts) < arg_atm.capacity)
		{
			ds_list_add(arg_atm.embarked_astronauts, arg_astronaut);
			call_unwrap(this.appear_setter, "disappear", arg_astronaut);
			return ok();
		}
		else return exception("ATM is full");
	#endregion
	
	#region UNIT TESTS
	
	case test:
		test_method(here, "disembark_test");
		test_method(here, "embark_test");
		test_method(here, "embark_atm_is_full");
		break;
	
	case "disembark_test":
		// setup
		var tup = setup_testable(here);
		var object = tup.item0;
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		var atm = instance_create_depth(0,0,0,obj_atm_small);
		call_unwrap(object, "embark", [atm, astro]);
		// act
		call_unwrap(object, "disembark", [atm, astro]);
		// assert
		mock_verify(mock_setter, "reappear", Times.Once); // in mock_setter, verify that stub for "reappear" has been called once
		// cleanup
		instance_destroy(astro);
		instance_destroy(atm);
		cleanup_testable(tup);
		break;
	
	case "embark_test":
		// setup
		var tup = setup_testable(here);
		var object = tup.item0;
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		var atm = instance_create_depth(0,0,0,obj_atm_small);
		// act
		call_unwrap(object, "embark", [atm, astro]);
		// assert
		mock_verify(mock_setter, "disappear", Times.Once);
		// cleanup
		instance_destroy(astro);
		instance_destroy(atm);
		cleanup_testable(tup);
		break;
	
	case "embark_atm_is_full":
		// setup
		var tup = setup_testable(here);
		var object = tup.item0;
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		var atm = instance_create_depth(0,0,0,obj_atm_small);
		ds_list_add(atm.embarked_astronauts, 13);
		ds_list_add(atm.embarked_astronauts, 14);
		ds_list_add(atm.embarked_astronauts, 15);
		// act
		var result = call(object, "embark", [atm, astro]);
		// assert
		mock_verify(mock_setter, "disappear", Times.Never);
		assert_equal(STATUS.PROBLEM, result.status, "status");
		assert_equal(PROBLEM.EXCEPTION, result.value, "problem");
		// cleanup
		instance_destroy(astro);
		instance_destroy(atm);
		cleanup_testable(tup);
		destroy(result);
		break;
	
	#endregion
	
	default:
		return refused();
}