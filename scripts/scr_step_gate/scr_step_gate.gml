/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	if(is_moving)
	{
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
	}
}