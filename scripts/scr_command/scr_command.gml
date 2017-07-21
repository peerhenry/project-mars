/// Is called after right clicking when astronauts are selected.

var orders_given = false; // boolean used for playing sound

// Cancel active task for selected astronauts
with(obj_astronaut_playable)
{
	if(is_selected && assigned_object != noone) scr_unassign_task(assigned_object);
}

// Check if player clicked an assignable
var el_assignable = instance_position(mouse_x, mouse_y, obj_assignable);
if(el_assignable == noone)
{
	el_assignable = instance_position(mouse_x, mouse_y, obj_grid_component_assignable);
}

// Check if player clicked an enemy
var enemy = instance_position(mouse_x, mouse_y, obj_astronaut_enemy);

if(el_assignable != noone)	// Assign a task
{
	// show_debug_message("DEBUG DEBUG assignable: " + string(el_assignable));
	// show_debug_message("assignable object index: " + string(el_assignable.object_index));
	// show_debug_message("hydroponics object index: " + string(obj_hydroponics));
	orders_given = scr_command_assign(el_assignable);
}
else if( enemy != noone )	// Or attack an enemy
{
	scr_command_attack(enemy);
	orders_given = true;
}
else if( !position_meeting(mouse_x, mouse_y, obj_gate) )	// Or move
{
	orders_given = scr_command_move();
}


if(orders_given)
{
	var s = irandom(2);
	switch s{
		case 0: audio_play_sound(sound_cmd_yep, 1, false); break;
		case 1: audio_play_sound(sound_cmd_understood, 1, false); break;
		case 2:	audio_play_sound(sound_cmd_acknowledged, 1, false); break;
	}
}