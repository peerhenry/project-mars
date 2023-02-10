/// @description checks if any adjacent spots contain object
/// @param instance
/// @param object_index
function scr_any_surrounding_instances(argument0, argument1) {

	var array = scr_get_surrounding_instances(argument0, argument1);
	for(var n = 0; n < 8; n++)
	{
		if(array[n] != noone) return true;
	}
	return false;


}
