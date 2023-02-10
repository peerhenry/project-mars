/// @arg entity
/// @arg arg_i
/// @arg arg_j
function scr_navgrid_should_clear_after_astro_pass(argument0, argument1, argument2) {
	var arg_entity = argument0;
	var arg_i = argument1;
	var arg_j = argument2;

	var should_clear = true;

	with(obj_movable)
	{
		if(id != arg_entity)
		{
			if(arg_i == occ_i && arg_j == occ_j){
				should_clear = false;
				break;
			}
		}
	}

	return should_clear;


}
