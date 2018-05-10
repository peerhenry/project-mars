var method = argument0;
var this = argument1;
var args = argument2;
var here = c_interaction_factory;

switch(method)
{
	case constructor: // can be remove if not needed
		this.notifier = args[0];	// borrowed
		return this;
	
	case get_clients:
		return ok(noone);

	case destructor: 
		return ok();
	
	case get_class_info:
		return ok_class_info([
			prop_interface("notifier", [
				prop_method_sig("notify_player", SIG.STRING_TO_VOID)
			]),
			prop_method("create_interaction", 
				t_interface([
					prop_method_sig("execute", SIG.VOID_TO_ANY)
				]),
				[
					p_object_any("interactable"),
					p_object("actor", obj_task_actor)
				]
			)
		]);
	
	case "create_interaction":
		var interactable = args[0];
		var actor = args[1];
		var interaction = noone;
		call_unwrap(this.notifier, "notify_player", "creating interaction for : " + object_get_name(interactable.object_index));
		switch(interactable.object_index)
		{
			case obj_atm_small:
			case obj_bed:
			case obj_med_bed:
				interaction = new(c_interaction_embarkable, [interactable, actor]);
				break;
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
		var testable = setup_testable(here);
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		var atm = instance_create_depth(0,0,0,obj_atm_small);
		// act
		var action = call_unwrap(testable, "create_interaction", [atm, astro]);
		// assert
		assert_equal(c_interaction_embarkable, action.class, "interaction class");
		assert_equal(astro, action.astronaut, "interaction astro");
		assert_equal(atm, action.embarkable, "interaction embarkable");
		// cleanup
		destroy(action);
		instance_destroy(astro);
		instance_destroy(atm);
		cleanup_testable(testable);
		break;
	
	default:
		return refused();
}