var method = argument0;
var this = argument1;
var args = argument2;
var here = c_interaction_atm;

switch(method)
{
	case constructor:
		this.embarker = args[0];	// borrowed
		this.notifier = args[1];	// borrowed
		this.atm = args[2];			// borrowed
		this.astronaut = args[3];	// borrowed
		return this;
	
	case get_dependencies:
		var deps = new(c_dependencies, [
			new_interface("embarker", [
				signature( "embark", t_void(), [ t_object(obj_atm), t_object(obj_astronaut) ] )
			]),
			new_interface("notifier", [
				signature( "notify_player", t_void(), t_string() )
			]),
			dependency("atm", t_object(obj_atm)),
			dependency("astronaut", t_object(obj_astronaut))
		]);
		return ok(deps);

	case "execute":
		var result = call(this.embarker, "embark", [this.atm, this.astronaut]);
		if(result.status != STATUS.OK) call_unwrap(this.notifier, "notify_player", result.message);
		destroy(result);
		return ok();
	
	#region tests
	
	case test:
		// todo: interaction must be an end path action, so it must be able to serve... movable @ end path?
		test_method(here, "test_execute");
		test_method(here, "test_notify");
		break;
	
	case "test_execute":
		var tup = setup_testable(here);
		var inst = tup.item0;
		var mock_embarker = tup.item1[0];
		var mock_ntf = tup.item1[1];
		// act
		void_unwrap(inst, "execute");
		// assert
		mock_verify(mock_embarker, "embark", Times.Once);
		mock_verify(mock_ntf, "notify_player", Times.Never);
		// cleanup
		cleanup_testable(tup);
		break;
	
	case "test_notify":
		var tup = setup_testable(here);
		show_debug_message("result count: " + string(scr_count_instances(obj_result)));
		var inst = tup.item0;
		show_debug_message("result count: " + string(scr_count_instances(obj_result)));
		var mock_embarker = tup.item1[0];
		show_debug_message("result count: " + string(scr_count_instances(obj_result)));
		var mock_ntf = tup.item1[1];
		show_debug_message("result count: " + string(scr_count_instances(obj_result)));
		var msg = "hihaho";
		var exc = exception(msg);
		show_debug_message("result count: " + string(scr_count_instances(obj_result)));
		mock_setup(mock_embarker, "embark", exc);
		show_debug_message("result count: " + string(scr_count_instances(obj_result)));
		// act
		void_unwrap(inst, "execute");
		show_debug_message("result count: " + string(scr_count_instances(obj_result)));
		// assert
		mock_verify(mock_embarker, "embark", Times.Once);
		show_debug_message("result count: " + string(scr_count_instances(obj_result)));
		mock_verify_args(mock_ntf, "notify_player", Times.Once, [msg]);
		show_debug_message("result count: " + string(scr_count_instances(obj_result)));
		// cleanup
		cleanup_testable(tup);
		with(obj_result)
		{
			show_debug_message("yo, it's:");
			show_debug_message(script_get_name(class));
			show_debug_message(string(status));
			show_debug_message(string(value));
		}
		break;
	
	#endregion
	
	default:
		return refused();
}