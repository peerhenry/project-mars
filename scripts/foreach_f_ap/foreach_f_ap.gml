/// @descr Apply a function with arguments from a function script to a collection
/// @arg collection
/// @arg script
/// @arg function
/// @arg args_placemarker
function foreach_f_ap(argument0, argument1, argument2, argument3) {
	var collection = argument0;
	var script = argument1;
	var func = argument2;
	var args = argument3;

	if(is_array(collection))
	{
		for(var n = 0; n < array_length_1d(collection); n++)
		{
			var elem = collection[n];
			var final_args = args_placemarker_substitute(args, elem);
			in(script, func, final_args);
		}
	}
	else if(ds_exists(collection, ds_type_list))
	{
		for(var n = 0; n < ds_list_size(collection); n++)
		{
			var elem = collection[|n];
			var final_args = args_placemarker_substitute(args, elem);
			in(script, func, final_args);
		}
	}
	else scr_panic("Argument0 was not a valid collection");

	args_placemarker_cleanup(args);


}
