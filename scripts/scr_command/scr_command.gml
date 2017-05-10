/// Is called after right click when astronauts are selected.

var orders_given = false; // boolean for sound

// 1. cancel active task for selected astronauts
with(obj_character)
{
	if(is_selected && assigned_object != noone) scr_unassign_task(assigned_object);
}

// 2. suit closet task
var el_assignable = instance_position(mouse_x, mouse_y, obj_assignable);
if(el_assignable != noone)
{
	// task the closest selected astronaut that can interact with the closet to interact with the closet.
	var d_min = 100000000;
	var assigned_astronaut = noone;
	with(obj_character)
	{
		if(is_selected){
			var ds = scr_d_squared(id, el_assignable);	
			if(ds < d_min){
				d_min = ds;
				assigned_astronaut = id;
			}
		}
	}
	
	if(assigned_astronaut != noone)
	{
		//show_message("mah boy: " + string(assigned_astronaut.suit_oxygen));
		var el_task = task.suit_closet;
		orders_given = scr_assign(el_assignable, assigned_astronaut, el_task);
	}
}
else if( !position_meeting(mouse_x, mouse_y, obj_gate) ){
	// 3. just navigation
	with(obj_character)
	{
		if(is_selected){
			orders_given = scr_navigate(id, mouse_x, mouse_y);
		}
	}
}

if(orders_given)
{
	var s = irandom(2);
	switch s{
		case 0: audio_play_sound(sound_cmd_yep,1,false); break;
		case 1: audio_play_sound(sound_cmd_understood,1,false); break;
		case 2:	audio_play_sound(sound_cmd_acknowledged,1,false); break;
	}
}