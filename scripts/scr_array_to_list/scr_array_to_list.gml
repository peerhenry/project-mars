function scr_array_to_list(argument0) {
	var arr = argument0;
	var list = ds_list_create();
	for(var n = 0; n < array_length_1d(arr); n++)
	{
		ds_list_add(list, arr[n]);
	}
	return list;


}
