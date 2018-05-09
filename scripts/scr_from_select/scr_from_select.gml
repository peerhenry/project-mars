/// @descr to be called on a collection of objects
/// @arg collection
/// @arg variable
var collection = argument0;
var variable = argument1;

if(is_array(collection))
{
	var output = [];
	var head = 0;
	for(var n = 0; n < array_length_1d(collection); n++)
	{
		var elem = collection[n];
		if(variable_instance_exists(elem, variable))
		{
			output[head] = variable_instance_get(elem, variable);
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
		if(variable_instance_exists(elem, variable))
		{
			var val = variable_instance_get(elem, variable);
			ds_list_add(output, val);
		}
	}
	return output;
}
scr_panic("Argument0 was not a valid collection");