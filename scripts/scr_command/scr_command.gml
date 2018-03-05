/// @arg x
/// @arg y
var arg_x = argument0;
var arg_y = argument1;
/// Is called after right clicking when astronauts are selected.

var script_container = global.script_container;

var orders_given = false; // boolean used for playing sound
var any_selected = false;
var selection_contains_cart = false;
var selection_contains_task_actor = false;
var selection_contains_astronaut = false;

// Cancel active task for selected entities
with(obj_movable)
{
	if(is_selected)
	{
		any_selected = true;
		scr_cancel_all(id);
		if(scr_instance_inherits(id, obj_astronaut)) selection_contains_astronaut = true;
		if(scr_instance_inherits(id, obj_task_actor)) selection_contains_task_actor = true;
		if(scr_instance_inherits(id, obj_cart)) selection_contains_cart = true;
	}
}

if(!any_selected) exit;
else show_debug_message("scr_command executing..."); // DEBUG

// Set possible clickables
var el_assignable = instance_position(arg_x, arg_y, obj_assignable);
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
	
	if(el_assignable != noone && el_assignable.owner == macro_player)	// Assign a task
	{
		orders_given = scr_command_assign(el_assignable);
	}
	else if( enemy != noone )	// Or attack an enemy
	{
		orders_given = scr_command_attack(enemy);
	}
}
else if(selection_contains_cart)
{
	if(component != noone && component.owner == macro_player)
	{
		orders_given = scr_command_cart_pickup(component);
	}
}

if( !orders_given && !position_meeting(arg_x, arg_y, obj_gate) )	// Or move
{
	orders_given = scr_command_move(arg_x, arg_y);
	if(orders_given)
	{
		var create_instance = script_container_resolve(script_container, "create_instance");
		script_execute(create_instance, arg_x, arg_y, obj_command);
	}
}


if(orders_given)
{
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