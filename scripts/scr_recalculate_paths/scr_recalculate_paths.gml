with(obj_astronaut)
{
	if(path_position > 0 && path_position < 1)
	{
		path_end();
		// recalculate path
		var end_x = scr_gi_to_rc(occ_i);
		var end_y = scr_gi_to_rc(occ_j);
		var can_go = scr_navigate_once(id, end_x, end_y);
		if(!can_go)
		{
			// stop whatever you were doing
			assigned_object = noone;
			current_action = astronaut_action.idle;
		}
	}
}