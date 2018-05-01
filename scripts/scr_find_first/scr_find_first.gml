/// @descr filter a collection
/// @arg collection
/// @arg variable
/// @arg value
var collection = argument0;
var variable = argument1;
var value = argument2;

if(is_array(collection))
{
	for(var n = 0; n < array_length_1d(collection); n++)
	{
		var elem = collection[n];
		if(variable_instance_exists(elem, variable) && variable_instance_get(elem, variable) == value)
		{
			return elem;
		}
	}
	return noone;
}
else if(ds_exists(collection, ds_type_list))
{
	var output = ds_list_create();
	for(var n = 0; n < ds_list_size(collection); n++)
	{
		var elem = collection[|n];
		if(variable_instance_exists(elem, variable) && variable_instance_get(elem, variable) == value)
		{
			return elem;
		}
	}
	return noone;
}
scr_panic("Argument0 was not a valid collection");
