/// @arg worm
function scr_worm_emerge(argument0) {
	with(argument0)
	{
		current_action = worm_action.emerging;
		sprite_index = spr_worm;
		image_speed = 0;
		is_underground = false;
	}


}
