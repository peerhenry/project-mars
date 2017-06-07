/// @description puts all elements from list 2 into list 1 (without checking for duplicates).
/// @param list1
/// @param list2

var list_1 = argument0;
var list_2 = argument1;

for(var n = 0; n < ds_list_size(list_2); n++)
{
	ds_list_add(list_1, ds_list_find_value(list_2, n));
}

ds_list_destroy(list_2);

return list_1;