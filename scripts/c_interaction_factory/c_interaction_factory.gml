var method = argument0;
var this = argument1;
var args = argument2;
var here = c_interaction_factory;

switch(method)
{
	case constructor: // can be remove if not needed
		this.embarker = args[0];	// borrowed
		this.notifier = args[1];	// borrowed
		return this;

	case get_dependencies:
		var deps = new(c_dependencies, [
			new_interface( "embarker", [
				signature( "embark", t_void(), [ t_object(obj_atm), t_object(obj_astronaut) ] )
			]),
			new_interface( "notifier", [
				signature( "notify_player", t_void(), t_string() )
			]),
		]);
		return ok(deps);
	
	case get_clients:
		return ok(noone);

	case destructor: 
		return ok();
	
	case "create_interaction":
		var interactable = args[0];
		var actor = args[1];
		var interaction = noone;
		call_unwrap(this.notifier, "notify_player", "creating interaction for : " + object_get_name(interactable.object_index));
		switch(interactable.object_index)
		{
			case obj_atm_small:
				interaction = new(c_interaction_atm, [this.embarker, this.notifier, interactable, actor]);
				break;
			case obj_bed:
			case obj_med_bed:
			case obj_suit_closet:
			case obj_hydroponics:
			case obj_printer:
			case obj_mdu_pile:
			case obj_fridge:
			default:
				interaction = new(c_interaction_notifier, this.notifier);
				break;
		}
		if(interaction == noone) return exception("could not create interaction");
		return ok(interaction);
	
	case test:
		test_method(here, "test_create_atm_interaction");
		break;
	
	case "test_create_atm_interaction":
		// arrange
		var tup = setup_testable(here);
		var testable = tup.item0;
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		var atm = instance_create_depth(0,0,0,obj_atm_small);
		// act
		var action = call_unwrap(testable, "create_interaction", [atm, astro]);
		// assert
		assert_equal(c_interaction_atm, action.class, "interaction class");
		assert_equal(tup.item1[0], action.embarker, "interaction embarker");
		assert_equal(tup.item1[1], action.notifier, "interaction norifier");
		assert_equal(astro, action.astronaut, "interaction astro");
		assert_equal(atm, action.atm, "interaction atm");
		// cleanup
		destroy(action);
		instance_destroy(astro);
		instance_destroy(atm);
		cleanup_testable(tup);
		break;
	
	default:
		return refused();
}