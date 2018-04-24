var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_boilerplate; // <=== CHANGE THIS

switch(method)
{
	// params begin at argument[2]
	case constructor: // can be remove if not needed
		this.embarker = argument[2];	// borrowed
		this.notifier = argument[3];	// borrowed
		return this;

	case get_dependencies:
		return new(c_dependencies, [
			new_interface( "embarker", [
				signature( "embark", t_void(), [ t_object(obj_atm), t_object(obj_astronaut) ] )
			]),
			new_interface( "notifier", [
				signature( "notify_player", t_void(), t_string() )
			]),
		]);

	case destructor: 
		instance_destroy(this);
		break;
	
	case "create_interaction":
		var interactable = argument[2];
		var actor = argument[2];
		var interaction = noone;
		call_unwrap(this.notifier, "notify_player", "creating interaction for : " + object_get_name(interactable.object_index));
		switch(interactable.object_index)
		{
			case obj_atm_small:
				interaction = new(c_interaction_atm, this.embarker, this.notifier, interactable, actor);
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
		test_method(here, "mytest");
		break;
	
	case "mytest":
		// arrange
		var tup = setup_testable(here);
		var testable = tup.item0;
		// act
		// assert
		// cleanup
		cleanup_testable(tup);
		break;
	
	default:
		return refused();
}