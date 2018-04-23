var list = argument0;
var size = ds_list_size(list);
var arr = [];
for(var n = size - 1; n >= 0; n--)
{
	arr[n] = ds_list_find_value(list, n);
}
return arr;