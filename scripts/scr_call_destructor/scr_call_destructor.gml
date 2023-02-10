/// @arg class
/// @arg instance
function scr_call_destructor(argument0, argument1) {
	var class = argument0;
	var instance = argument1;
	return script_execute(class, destructor, instance);


}
