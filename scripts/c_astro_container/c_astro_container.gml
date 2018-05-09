#region set here, method and this
var here = c_astro_container; // bed/med_bed
var method = argument0;
var this = argument1;
var args = argument2;
#endregion

switch(method)
{
	case constructor:
		this.appear_setter = args[0];
		this.occupant = noone;
		this.full_message = "Cannot enter; already occupied."
		return this;
	
	case destructor:
		ds_list_destroy(this.embarked_astronauts);
		return ok();
	
	/*case get_dependencies:
		return ok_class_info([
			prop_interface("appear_setter", [
				prop_signature("disappear", t_void(), t_object(obj_astronaut)),
				prop_signature("reappear", t_void(), t_object(obj_astronaut))
			]),
			prop_object("occupant", t_object(obj_astronaut)) // example of a prop that does not get injected
		]);*/
	
	case get_clients:
		// todo: depend on relevant interaction
		return ok();
	
	#region METHODS
	
	case "enter":
		var arg_astronaut = args[0];
		if(this.occupant == noone)
		{
			this.occupant = arg_astronaut;
			call_unwrap(this.appear_setter, "disappear", arg_astronaut);
			return ok();
		}
		else return exception(this.full_message);
	
	case "eject":
		if(occupant == noone) return ok(); // Don't do anything if container has no occupant
		var result = call(this.appear_setter, "reappear", this.occupant);
		if(result.status != STATUS.OK)
		{
			// todo, inject notifier
			resolve_execute(script_container, "alert_player", "Astronaut cannot exit: " + result.value);
			// create an alarm for when to try again to eject again
			
			// make eject action
			var eject = new(c_action_decorator, [this, "eject"]);
			// put it in a decorator
			var dec = new(c_action_decorator, eject);
			// append destruction of the eject action
			dec = call_unwrap(dec, "then", new(c_action_script, [destroy, eject]));
			var delayed = new(c_delay, [dec, 5]); // try again after this many seconds
			void_unwrap(delayed, "set"); // start the timer
		}
		else
		{
			this.occupant = noone;
			image_index++;
		}
		destroy(result);
		return ok();
		
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
		call_unwrap(object, "embark", astro);
		// act
		call_unwrap(object, "disembark", astro);
		// assert
		mock_verify(mock_setter, "reappear", Times.Once); // in mock_setter, verify that stub for "reappear" has been called once
		// cleanup
		instance_destroy(astro);
		cleanup_testable(tup);
		break;
	
	case "embark_test":
		// setup
		var tup = setup_testable(here);
		var object = tup.item0;
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		// act
		call_unwrap(object, "embark", astro);
		// assert
		mock_verify(mock_setter, "disappear", Times.Once);
		// cleanup
		instance_destroy(astro);
		cleanup_testable(tup);
		break;
	
	case "embark_atm_is_full":
		// setup
		var tup = setup_testable(here);
		var object = tup.item0;
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
		cleanup_testable(tup);
		destroy(result);
		break;
	
	#endregion
	
	default:
		return refused();
}