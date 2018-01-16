/// @arg x
/// @arg y
var arg_x = argument0;
var arg_y = argument1;
/// Is called after right clicking when astronauts are selected.

var script_container = global.script_container;

var orders_given = false; // boolean used for playing sound
var any_selected = false;

// Cancel active task for selected astronauts
with(obj_astronaut_playable)
{
	if(is_selected)
	{
		any_selected = true;
		if(current_action != astronaut_action.idle) scr_cancel_current_action(id);
		if(assigned_object != noone) scr_unassign_task(assigned_object);
	}
}
if(!any_selected) exit;

// Check if player clicked an assignable
var el_assignable = instance_position(arg_x, arg_y, obj_assignable);

// Check if player clicked an enemy
var enemy = instance_position(arg_x, arg_y, obj_astronaut_enemy);
if(enemy == noone)
{
	constr = scr_enemy_construction_position(arg_x, arg_y);
	if(constr != noone)
	{
		enemy = constr;
	}
}

if(el_assignable != noone)	// Assign a task
{
	orders_given = scr_command_assign(el_assignable);
}
else if( enemy != noone )	// Or attack an enemy
{
	scr_command_attack(enemy);
	orders_given = true;
}
else if( !position_meeting(arg_x, arg_y, obj_gate) )	// Or move
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
	var s = irandom(2);
	var play_sound = script_container_resolve(script_container, "play_sound");
	switch s{
		case 0: script_execute(play_sound, sound_cmd_yep); break;
		case 1: script_execute(play_sound, sound_cmd_understood); break;
		case 2:	script_execute(play_sound, sound_cmd_acknowledged); break;
	}
}