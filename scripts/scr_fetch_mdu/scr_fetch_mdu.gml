/// @description Finds an mdu pile to assign and begins action.
/// @param astronaut
/// @param construction
var arg_astronaut = argument0;
var arg_construction = argument1;
with(obj_mdu_pile)
{
	var assigned = scr_assign(id, arg_astronaut);
	if(assigned)
	{
		scr_update_astro_and_construction(arg_astronaut, arg_construction, astronaut_action.fetching_mdu);
		return true;
	}
}
return false;