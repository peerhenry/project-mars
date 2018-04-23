/// @descr call destroy on each element of the collection; works for arrays and lists
/// @arg collection
var collection = argument0;

if(is_array(collection))
{
	for(var n = 0; n < array_length_1d(collection); n++)
	{
		var elem = collection[n];
		destroy(elem);
	}
}
else if(ds_exists(collection, ds_type_list))
{
	for(var n = 0; n < ds_list_size(collection); n++)
	{
		var elem = collection[|n];
		destroy(elem);
	}
	ds_list_destroy(collection);
}
scr_panic("Argument0 was not a valid collection");