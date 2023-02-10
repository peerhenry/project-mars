/// @descr filter a collection based on a method
/// @arg collection
/// @arg checking_instance
/// @arg checking_method
function scr_where(argument0, argument1, argument2) {
	var collection = argument0;
	var instance = argument1;
	var func = argument2;

	if(is_array(collection))
	{
		var output = [];
		var head = 0;
		for(var n = 0; n < array_length_1d(collection); n++)
		{
			var elem = collection[n];
			if(call_unwrap(instance, func, elem))
			{
				output[head] = elem
				head ++;
			}
		}
		return output;
	}
	else if(ds_exists(collection, ds_type_list))
	{
		var output = ds_list_create();
		for(var n = 0; n < ds_list_size(collection); n++)
		{
			var elem = collection[|n];
			if(call_unwrap(instance, func, elem))
			{
				ds_list_add(output, elem);
			}
		}
		return output;
	}
	scr_panic("Argument0 was not a valid collection");


}
