/// @descr same as map_method without putting return values into a collection
/// @arg collection
/// @arg instance
/// @arg method
var collection = argument0;
var thing = argument1;
var method = argument2;

if(is_array(collection))
{
	for(var n = 0; n < array_length_1d(collection); n++)
	{
		var elem = collection[n];
		call_unwrap(thing, method, elem);
	}
}
else if(ds_exists(collection, ds_type_list))
{
	for(var n = 0; n < ds_list_size(collection); n++)
	{
		var elem = collection[|n];
		call_unwrap(thing, method, elem);
	}
}
else scr_panic("Argument0 was not a valid collection");