/// @arg x
/// @arg y
function scr_command(argument0, argument1) {
	var arg_x = argument0;
	var arg_y = argument1;
	/// Is called after right clicking when astronauts are selected.

	var script_container = global.script_container;

	var orders_given = false; // boolean used for playing sound
	var any_selected = false;
	var selection_contains_cart = false;
	var selection_contains_task_actor = false;
	var selection_contains_astronaut = false;
	var selected_cart = noone;
	var selected_cart_count = 0;

	// Cancel active task for selected entities
	with(obj_movable)
	{
		if(is_selected)
		{
			any_selected = true;
			scr_cancel_all(id);
			if(scr_instance_inherits(id, obj_astronaut)) selection_contains_astronaut = true;
			if(scr_instance_inherits(id, obj_task_actor)) selection_contains_task_actor = true;
			if(scr_instance_inherits(id, obj_cart))
			{
				selected_cart = id;
				selection_contains_cart = true;
				selected_cart_count++;
			}
		}
	}

	if(!any_selected) exit;

	// Set possible clickables
	var interactable = instance_position(arg_x, arg_y, obj_interactable);
	var component = instance_position(arg_x, arg_y, obj_base_component);
	var movable = instance_position(arg_x, arg_y, obj_movable);
	var wall = instance_position(arg_x, arg_y, obj_wall);

	if(selection_contains_task_actor)
	{
		// Set clicked enemey
		var enemy = noone;
		if(movable != noone && movable.owner == macro_enemy) enemy = movable;
		else if(wall != noone && wall.owner == macro_enemy) enemy = wall;
		else if(component != noone && component.owner == macro_enemy) enemy = component;	
	
		if(interactable != noone && interactable.owner == macro_player)	// Assign a task
		{
			orders_given = scr_command_assign(interactable);
		}
		else if( enemy != noone )	// Or attack an enemy
		{
			orders_given = scr_command_attack(enemy);
		}
	}
	else if(selection_contains_cart && selected_cart_count == 1) // CART SHIT
	{
		// PICKUP
		if(
			selected_cart.carrying_instance == noone
			&& component != noone
			&& component.owner == macro_player
			&& !component.under_construction
		)
		{
			orders_given = scr_command_cart_pickup(component);
		}
	}

	if( !orders_given && !position_meeting(arg_x, arg_y, obj_gate) )	// Or move
	{
		orders_given = scr_command_move(arg_x, arg_y);
		if(orders_given)
		{
			resolve_execute(script_container, "create_instance", arg_x, arg_y, obj_command);
		}
	}


	if(orders_given)
	{
		with(obj_movable)
		{
			if(is_selected) autotasking = false;
		}
	
		var play_sound = script_container_resolve(script_container, "play_sound");
		if(selection_contains_astronaut)
		{
			var s = irandom(2);
			switch s{
				case 0: script_execute(play_sound, sound_cmd_yep); break;
				case 1: script_execute(play_sound, sound_cmd_understood); break;
				case 2:	script_execute(play_sound, sound_cmd_acknowledged); break;
			}
		}
		else 
		{
			script_execute(play_sound, sound_robot_confirm);
		}
	}


}
