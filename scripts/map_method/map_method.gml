/// @arg collection
/// @arg instance
/// @arg method
var collection = argument0;
var thing = argument1;
var method = argument2;
var output = noone;

if(is_array(collection))
{
	output = [];
	for(var n = array_length_1d(collection) - 1; n >= 0; n--)
	{
		var elem = collection[n];
		var mapped = call_unwrap(thing, method, elem);
		output[n] = mapped;
	}
}
else if(ds_exists(collection, ds_type_list))
{
	output = ds_list_create();
	for(var n = 0; n < ds_list_size(collection); n++)
	{
		var elem = collection[|n];
		var mapped = call_unwrap(thing, method, elem);
		ds_list_add(output, mapped);
	}
}
else scr_panic("invalid collection");
return output;