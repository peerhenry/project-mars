var here = c_astro_container; // bed / med_bed
var method = argument0;
var this = argument1;
var args = argument2;

switch(method)
{
	#region standard methods
	case constructor:
		this.appear_setter = args[0];
		this.occupant = noone;
		this.full_message = "Cannot enter; already occupied."
		return this;
	
	case destructor:
		
		return ok();
	
	case get_clients:
		return ok();
	
	case get_class_info:
		return ok_class_info([
			prop_interface("appear_setter", [
				prop_method("disappear", t_void(), p_object("astro", obj_astronaut)),
				prop_method("reappear", t_void(), p_object("astro", obj_astronaut))
			]),
			prop_object("occupant", obj_astronaut, NOT_INJECTED), // thing is not injected, but it's not owned, so test standards expects it to exist after destroy but it dont :(
			prop_string("full_message", NOT_INJECTED),
			prop_method("enter", t_void(), p_object("arg_astronaut", obj_astronaut)),
			prop_method_void("eject", t_void()),
		]);
	#endregion
	
	#region METHODS
	
	case "enter":
		var arg_astronaut = args[0];
		if(this.occupant == noone)
		{
			this.occupant = arg_astronaut;
			this.image_index++;
			call_unwrap(this.appear_setter, "disappear", arg_astronaut);
			return ok();
		}
		else return exception(this.full_message);
	
	case "eject":
		if(this.occupant == noone) return ok(); // Don't do anything if container has no occupant
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
			this.image_index++;
		}
		destroy(result);
		return ok();
		
	#endregion
	
	#region UNIT TESTS
	
	case test:
		test_method(here, "eject_test");
		test_method(here, "enter_test");
		test_method(here, "enter_is_full");
		break;
	
	case "eject_test":
		// setup
		var object = setup_testable(here);
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		call_unwrap(object, "enter", astro);
		// act
		uvoid(object, "eject");
		// assert
		mock_verify(mock_setter, "reappear", Times.Once); // in mock_setter, verify that stub for "reappear" has been called once
		// cleanup
		instance_destroy(astro);
		cleanup_testable(object);
		break;
	
	case "enter_test":
		// setup
		var object = setup_testable(here);
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		// act
		call_unwrap(object, "enter", astro);
		// assert
		mock_verify(mock_setter, "disappear", Times.Once);
		// cleanup
		instance_destroy(astro);
		cleanup_testable(object);
		break;
	
	case "enter_is_full":
		// setup
		var object = setup_testable(here);
		var mock_setter = object.appear_setter;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		object.occupant = 12;
		// act
		var result = call(object, "enter", astro);
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