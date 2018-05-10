/// @descr destroys the placemarkers as soon as they are substituted
/// @arg arguments_array
/// @arg value
var arguments = argument0;
var value = argument1;
var maxn = scr_length(arguments) - 1;
var finalized_args = [];
for(var n = maxn; n >= 0; n--)
{
	var next = arguments[n];
	if(instance_exists(next) && variable_instance_exists(next, "placemarker"))
	{
		finalized_args[n] = value;
	}
	else finalized_args[n] = next;
}
return finalized_args;