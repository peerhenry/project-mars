/// @arg x
/// @arg y
var arg_x = argument0;
var arg_y = argument1;
/// Is called after right clicking when astronauts are selected.

var script_container = global.script_container;

var orders_given = false; // boolean used for playing sound
var any_selected = false;
var selectable_is_astronaut = false;

// Cancel active task for selected entities
with(obj_movable)
{
	if(is_selected)
	{
		any_selected = true;
		scr_cancel_all(id);
		if(object_is_ancestor(object_index, obj_astronaut)) selectable_is_astronaut = true;
	}
}
if(!any_selected) exit;

// Check if player clicked an assignable
var el_assignable = instance_position(arg_x, arg_y, obj_assignable);

// Check if player clicked an enemy
var enemy = instance_position(arg_x, arg_y, obj_movable);

if(enemy == noone)
{
	enemy = scr_enemy_component_position(arg_x, arg_y);
}
else if(enemy.owner != macro_enemy)
{
	enemy = noone;
}

if(el_assignable != noone && el_assignable.owner == macro_player)	// Assign a task
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


if(orders_given && selectable_is_astronaut)
{
	var s = irandom(2);
	var play_sound = script_container_resolve(script_container, "play_sound");
	switch s{
		case 0: script_execute(play_sound, sound_cmd_yep); break;
		case 1: script_execute(play_sound, sound_cmd_understood); break;
		case 2:	script_execute(play_sound, sound_cmd_acknowledged); break;
	}
}