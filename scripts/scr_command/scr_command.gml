/// Is called after right click when astronauts are selected.

var orders_given = false; // boolean for sound

// 1. cancel active task for selected astronauts
with(obj_astronaut_playable)
{
	if(is_selected && assigned_object != noone) scr_unassign_task(assigned_object);
}

// 2. suit closet task
var el_assignable = instance_position(mouse_x, mouse_y, obj_assignable);
if(el_assignable != noone)
{
	// from all selected astronauts, get the one closest to the assignable
	var d_min = 100000000;
	var assigned_astronaut = noone;
	with(obj_astronaut_playable)
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
		orders_given = scr_assign(el_assignable, assigned_astronaut);
		// cancel construction
		if(orders_given)
		{
			with(assigned_astronaut)
			{
				if(current_action = astronaut_action.constructing || current_action = astronaut_action.moving_to_construction)
				{
					construction[@construction_build_state] = build_state.ready;
				}
				current_action = astronaut_action.moving_by_command;
			}
		}
	}
}
else if( !position_meeting(mouse_x, mouse_y, obj_gate) ){
	// 3. just navigation
	with(obj_astronaut_playable)
	{
		if(is_selected){
			orders_given = scr_navigate(id, mouse_x, mouse_y);
			if(orders_given)
			{
				if(current_action = astronaut_action.constructing || current_action = astronaut_action.moving_to_construction)
				{
					construction[@construction_build_state] = build_state.ready;
				}
				current_action = astronaut_action.moving_by_command;
			}
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