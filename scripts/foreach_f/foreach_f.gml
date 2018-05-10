/// @descr Apply a function from a function script to a collection
/// @arg collection
/// @arg script
/// @arg function
var collection = argument0;
var script = argument1;
var function = argument2;

if(is_array(collection))
{
	for(var n = 0; n < array_length_1d(collection); n++)
	{
		var elem = collection[n];
		in(script, function, elem);
	}
}
else if(ds_exists(collection, ds_type_list))
{
	for(var n = 0; n < ds_list_size(collection); n++)
	{
		var elem = collection[|n];
		in(script, function, elem);
	}
}
else scr_panic("Argument0 was not a valid collection");