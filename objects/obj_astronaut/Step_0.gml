/// @description Update astronaut

// 1. kill if health reached zero
if(has_died) return;
else if(astronaut_health <= 0)
{
	is_walking = false;
	path_end();
	if(assigned_object != noone) scr_unassign_task(assigned_object);
	// die
	scr_kill(id); // destroys astronaut and replaces it with a corpse object.
	has_died = true;
	return;
}

// 2. 
// - Set move direction sprite 
// - check if going through gate
// - set the room
if(is_walking)
{
	image_speed = 1.2;
	dx = x - prev_x;
	dy = y - prev_y;
	if(dx > 0)
	{
		moveDir = right;
	}
	else if(dx < 0)
	{
		moveDir = left;
	}
	if(dy < 0)
	{
		if(dy < dx - 0.1) moveDir = up;
	}
	else if(dy > 0 && dy > dx + 0.1)
	{
		moveDir = down;
	}
	
	prev_x = x;
	prev_y = y;
	
	// must be a rectangle because otherwise room detection may be flawed.
	var colliding_gate = collision_rectangle(x-13, y-13, x+13, y+13, obj_gate, false, true);
	if(colliding_gate != noone)
	{
		if(!is_moving_through_gate) is_moving_through_gate = true;
	}
	else if(is_moving_through_gate) // just left the gate
	{
		is_moving_through_gate = false;
		var inside_room = scr_room_at(x, y);
		if(inside_room == noone) is_outside = true;
		else is_outside = false;
	}
	
	switch(moveDir)
	{
		case up:
		{
			if(sprite_index != sprite_walk_up) sprite_index = sprite_walk_up;
			break;
		}
		case down:
		{
			if(sprite_index != sprite_walk_down) sprite_index = sprite_walk_down;
			break;
		}
		case left:
		{
			if(sprite_index != sprite_walk_right || image_xscale != -1)
			{
				sprite_index = sprite_walk_right;
				image_xscale = -1;
			}
			break;
		}
		case right:
		{
			if(sprite_index != sprite_walk_right || image_xscale != 1)
			{
				sprite_index = sprite_walk_right;
				image_xscale = 1;
			}
			break;
		}
	}
}
else
{
	// 3. update whatever it is astronaut is doing.
	
	// constructing
	if(current_action = astronaut_action.constructing)
	{
		construction[@construction_completion] = construction[construction_completion] + 1;
		if(construction[construction_completion] >= 100)
		{
			scr_build_complete(construction);
			current_action = astronaut_action.idle;
		}
	}
}

// 4. update from path
if(path_position > 0 && path_position < 1)
{
	if(!is_walking) is_walking = true;
}
else
{
	if(is_walking && path_position == 1) // path end reached.
	{
		prev_x = x; // used for sprite orientation
		prev_y = y;
		is_walking = false;
		image_speed = 0;
		image_index = 0;
		path_end();
		
		if(assigned_object != noone) // there is a task to perform at the end of the path.
		{
			scr_perform(assigned_object);
		}
		else
		{
			switch(current_action)
			{
				case astronaut_action.moving_to_construction:
					current_action = astronaut_action.constructing;
					break;
				case astronaut_action.moving_by_command:
					current_action = astronaut_action.idle;
					break;
			}
		}
	}
	else
	{
		if(assigned_object != noone) // astronaut is adjacent to assigned task
		{
			scr_perform(assigned_object);
		}
	}
}

// 6. update health and oxygen.
var oxygen_around = !is_outside;
if(!is_moving_through_gate){
	var inside_room = scr_room_at(x, y);
	oxygen_around = !is_outside && inside_room.oxygen_level > global.oxygen_empty_level;
}
var state = 0;
if(oxygen_around) state = 1;
if(wears_suit) state += 2;

switch(state)
{
	case 0: // no suit, no oxygen
		astronaut_health -= global.suffocation_speed; // suffocate
		break;
	case 1: // no suit, oxygen around
		if(!is_moving_through_gate)
		{
			if(inside_room.oxygen_level < 50)
			{
				astronaut_health -= global.suffocation_speed*(1 - inside_room.oxygen_level/100)*0.25; // health drainage is linear to 25% of O2 shortage
				if(astronaut_health < 0) astronaut_health = 0;
			}
			else if(astronaut_health < 100 && inside_room.oxygen_level > 90) // good oxygen, astronaut will slowly regenerate
			{
				astronaut_health += global.regeneration_speed;
			}
		}
		break;
	case 2: // suit, no oxygen
		if(suit_oxygen > 0) // check suit
		{
			suit_oxygen -= global.suit_o2_depletion_speed;
			if(suit_oxygen < 0) suit_oxygen = 0;
		}
		else
		{
			astronaut_health -= global.suffocation_speed; // suffocate
			if(astronaut_health < 0) astronaut_health = 0;
		}
		break;
	case 3: // suit, oxygen
		// no problem
		break;
}