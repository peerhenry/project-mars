/// @descr call a parameterless method in each element of the collection and aggregate teh results
/// @arg collection
/// @arg method
function morph(argument0, argument1) {
	var collection = argument0;
	var func = argument1;

	if(is_array(collection))
	{
		var output = [];
		for(var n = 0; n < array_length_1d(collection); n++)
		{
			var elem = collection[n];
			var mapped = void_unwrap(elem, func);
			output[n] = mapped;
		}
		return output;
	}
	else if(ds_exists(collection, ds_type_list))
	{
		var output = ds_list_create();
		for(var n = 0; n < ds_list_size(collection); n++)
		{
			var elem = collection[|n];
			var mapped = void_unwrap(elem, func);
			ds_list_add(output, mapped);
		}
		return output;
	}
	scr_panic("Argument0 was not a valid collection");


}
