with(obj_astronaut)
{
	if(path_exists(path))
	{
		// path_end();
		// recalculate path
		var end_x = scr_gi_to_rc(dest_i);
		var end_y = scr_gi_to_rc(dest_j);
		var can_go = scr_navigate_once(id, end_x, end_y);
		if(!can_go)
		{
			// stop whatever you were doing
			if(assigned_object != noone) scr_unassign_task(assigned_object);
			construction = noone;
			scr_cancel_walking(id);
		}
	}
}