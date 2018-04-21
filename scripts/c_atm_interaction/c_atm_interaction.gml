var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_atm_interaction;

// todo:
// - set this class as end_path_action in astronaut in the click event
// - call the end path action
// - get interface somehow, and test that it can serve the client (movable?)
// - put this class in test_classes
// - test that embarker can serve this

switch(method)
{
	case constructor:
		this.embarker = argument[2];	// borrowed
		this.notifier = argument[3];	// borrowed
		this.atm = argument[4];			// borrowed
		this.astronaut = argument[5];	// borrowed
		return this;

	case destructor: 
		instance_destroy(this);
		break;
	
	case get_dependencies:
		var deps = new_dependencies(
			named("embarker", new_interface([
				signature( "embark", t_void(), [ t_object(obj_astronaut) ] )
			])),
			named("notifier", new_interface([
				signature( "notify_player", t_void(), t_string() )
			])),
			named("atm", t_object(obj_atm)),
			named("atm", t_object(obj_astronaut))
		);
		return deps;

	case "execute":
		var result = call(this.embarker, "embark", this.atm, this.astronaut);
		if(result.status != STATUS.OK) call(this.notifier, "notify_player", result.message);
		destroy(result);
		return ok();
	
	#region tests
	case get_dependency: // For interface testing
		var name = argument[1];
		if(name == "embarker") return new_interface([
			["embark", t_void(), [t_object(obj_atm), t_object(obj_astronaut)]]
		]);
		if(name == "notifier") return new_interface([
			["notify_player", t_void(), t_string()]
		]);
		scr_panic("no dependency: " + name);
		break;
	
	case test:
		// todo: interaction must be an end path action, so it must be able to serve... movable @ end path?
		test_method(here, "test_execute");
		test_method(here, "test_notify");
		break;
	
	#region setup / cleanup
	case "test_setup":
		var i_embarker = in(here, get_dependency, "embarker");
		var mock_embarker = mock(i_embarker);
		var i_ntf = in(here, get_dependency, "notifier");
		var mock_ntf = mock(i_ntf);
		var atm = instance_create_depth(0,0,0,obj_atm_small);
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		var inst = new(c_atm_interaction, mock_embarker, mock_ntf, atm, astro);
		var tup = tuple(mock_embarker, mock_ntf, inst, atm, astro);
		return tup;
	
	case "test_cleanup":
		var tup = argument[1];
		destroy(tup.item0); // embarker mock
		destroy(tup.item1);	// notifier mock
		destroy(tup.item2); // instance
		instance_destroy(tup.item3); // atm
		instance_destroy(tup.item4); // astro
		break;
	#endregion
	
	case "test_execute":
		var tup = in(here, "test_setup");
		var inst = tup.item2;
		var mock_ntf = tup.item1;
		var mock_embarker = tup.item0;
		// act
		call_unwrap(inst, "execute");
		// assert
		mock_verify(mock_embarker, "embark", Times.Once);
		mock_verify(mock_ntf, "notify_player", Times.Never);
		// cleanup
		in(here, "test_cleanup", tup);
		break;
	
	case "test_notify":
		var tup = in(here, "test_setup");
		var inst = tup.item2;
		var mock_ntf = tup.item1;
		var mock_embarker = tup.item0;
		var msg = "hihaho";
		var exc = exception(msg);;
		mock_setup(mock_embarker, "embark", exc);
		// act
		call_unwrap(inst, "execute");
		// assert
		mock_verify(mock_embarker, "embark", Times.Once);
		mock_verify_args(mock_ntf, "notify_player", Times.Once, [msg]);
		// cleanup
		in(here, "test_cleanup", tup);
		break;
	
	#endregion
	
	default:
		return refused();
}