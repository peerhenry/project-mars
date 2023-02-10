/// @arg trigger
function scr_condition_one_full_oxygen_tank(argument0) {
	var arg_trigger = argument0;

	var has_one = false;
	with(obj_oxygen_tank)
	{
		if(owner == arg_trigger.owner && scr_get_grid_prop(id, macro_grid_oxygen, macro_grid_prop_value) > 99)
		{
			has_one = true;
		}
	}
	return has_one;


}
