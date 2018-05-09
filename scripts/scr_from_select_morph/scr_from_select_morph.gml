/// @descr to be called on a collection of objects that contain class instances on the variable
/// @arg collection
/// @arg variable
/// @arg method
var collection = argument0;
var variable = argument1;
var method = argument2;

if(is_array(collection))
{
	var output = [];
	var head = 0;
	for(var n = 0; n < array_length_1d(collection); n++)
	{
		var elem = collection[n];
		if(variable_instance_exists(elem, variable))
		{
			var thing = variable_instance_get(elem, variable);
			output[head] = void_unwrap(thing, method);
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
			var thing = variable_instance_get(elem, variable);
			var val = void_unwrap(thing, method);
			ds_list_add(output, val);
		}
	}
	return output;
}
scr_panic("Argument0 was not a valid collection");