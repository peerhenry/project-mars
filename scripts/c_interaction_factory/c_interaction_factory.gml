var method = argument0;
var this = argument1;
var args = argument2;
var here = c_interaction_factory;

switch(method)
{
	#region standards
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
	#endregion
	
	#region create_interaction
	case "create_interaction":
		var interactable = args[0];
		var actor = args[1];
		var interaction = noone;
		call_unwrap(this.notifier, "notify_player", "creating interaction for : " + object_get_name(interactable.object_index)); // DEBUG
		var interaction = new_action(this, "interact", [ interactable, actor ]);
		return ok(interaction);
	#endregion
	
	#region interactions
	
	case "interact":
		var interactable = args[0];
		var actor = args[1];
		
		in(fs_astro, "set_end_path_action", [actor, noone]);
		
		var result = 0;
		var o_indx = interactable.object_index;
		switch(o_indx)
		{
			case obj_atm_small:
				result = call(interactable, "embark", actor);
				break;
			case obj_suit_closet:
				if(interactable.holds_suit) scr_closet_take_suit(interactable, actor);
				else scr_closet_put_suit(interactable, actor);
				result = ok();
				break;
			case obj_bed:
			case obj_med_bed:
				result = call(interactable, "enter", actor);
				break;
			case obj_hydroponics:
				var was_inserted = scr_give_entity_new_item(actor, inv_space.food);
				if(was_inserted)
				{
					interactable.food_level = 0;
				}
				break;
			case obj_fridge:
				var actor_carries_food = scr_inventory_has_item_type(actor.inventory, inv_space.food);
				if( actor_carries_food )
				{
					scr_inventory_transfer(actor.inventory, interactable.inventory, inv_space.food);
				}
				else
				{
					scr_inventory_transfer(interactable.inventory, actor.inventory, inv_space.food);
				}
				result = ok();
				break;
			case obj_printer:
			case obj_mdu_pile:
			default:
				resolve_execute(global.script_container, "alert_player", "interaction not implemented for " + object_get_name(o_indx));
				result = ok();
				break;
		}
		return result;
	
	#endregion
	
	#region tests
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
		assert_equal(c_action, action.class, "interaction class");
		assert_equal(atm, action.arguments[0], "interaction embarkable");
		assert_equal(astro, action.arguments[1], "interaction astro");
		// cleanup
		destroy(action);
		instance_destroy(astro);
		instance_destroy(atm);
		cleanup_testable(testable);
		break;
	#endregion
	
	default:
		return refused();
}