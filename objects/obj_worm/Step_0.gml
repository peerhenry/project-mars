// update worm action

switch(current_action)
{
	case worm_action.navigating_to_basetile:
		if(path_position == 1)
		{
			path_end();
			path_delete(path);
			path = noone;
			x = basetile_target.x; // snap to proper location
			y = basetile_target.y;
			if(basetile_target != noone && instance_exists(basetile_target) && !basetile_target.is_broken)
			{
				current_action = worm_action.attacking_basetile;
			}
			else
			{
				scr_worm_emerge(id);
			}
		}
		break;
	case worm_action.attacking_basetile:
		if(!is_bumping)
		{
			is_bumping = true;
			alarm[0] = 1;
		}
		break;
}