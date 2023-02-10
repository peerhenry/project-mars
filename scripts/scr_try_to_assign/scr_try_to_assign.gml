/// @description Check if conditions for assignment are met
/// @param assignable
/// @param astronaut
function scr_try_to_assign(argument0, argument1) {
	var arg_assignable = argument0;
	var arg_astronaut = argument1;

	if(scr_can_assign(arg_assignable, arg_astronaut))
	{
		return scr_assign(arg_assignable, arg_astronaut);
	}
	return false;


}
