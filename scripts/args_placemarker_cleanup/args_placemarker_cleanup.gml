/// @descr destroy the placemarkers in an array with placemarkers
/// @arg arguments_array
function args_placemarker_cleanup(argument0) {
	var arguments = argument0;
	var maxn = scr_length(arguments) - 1;
	for(var n = maxn; n >= 0; n--)
	{
		var next = arguments[n];
		if(instance_exists(next) && variable_instance_exists(next, "placemarker"))
		{
			destroy(next);
		}
	}


}
