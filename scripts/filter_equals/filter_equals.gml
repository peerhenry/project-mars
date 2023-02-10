/// @descr call a method in each element of the array
/// @arg collection
/// @arg variable
/// @arg value
function filter_equals(argument0, argument1, argument2) {
	var collection = argument0;
	var variable = argument1;
	var value = argument2;

	if(is_array(collection))
	{
		var output = [];
		var head = 0;
		for(var n = 0; n < array_length_1d(collection); n++)
		{
			var elem = collection[n];
			if(variable_instance_exists(elem, variable))
			{
				var valid = variable_instance_get(elem, variable) == value;
				if(valid)
				{
					output[head] = elem;
					head ++;
				}
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
			if(variable_instance_exists(elem, variable))
			{
				var valid = variable_instance_get(elem, variable) == value;
				if(valid) ds_list_add(output, elem);
			}
		}
		return output;
	}
	scr_panic("Argument0 was not a valid collection");


}
