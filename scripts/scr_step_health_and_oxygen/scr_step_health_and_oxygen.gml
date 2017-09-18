/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	var oxygen_around = !is_outside;
	var inside_room = scr_room_at(x, y);
	if(!is_moving_through_gate)
	{
		oxygen_around = !is_outside && inside_room.oxygen_level >= global.oxygen_empty_level;
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
				// Consume oxygen from room:
				inside_room.oxygen_level -= oxygen_consumption/ds_list_size(inside_room.tiles);
				if(inside_room.oxygen_level < 0) inside_room.oxygen_level = 0;
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
			// Consume oxygen from room:
			if(inside_room != noone)
			{
				inside_room.oxygen_level -= oxygen_consumption/ds_list_size(inside_room.tiles);
				if(inside_room.oxygen_level < 0) inside_room.oxygen_level = 0;
			}
			break;
	}
}