/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
function scr_line_collides_with_solids(argument0, argument1, argument2, argument3) {
	var arg_x1 = argument0;
	var arg_y1 = argument1;
	var arg_x2 = argument2;
	var arg_y2 = argument3;

	var _list = ds_list_create();
	collision_line_list(arg_x1, arg_y1, arg_x2, arg_y2, all, false, false, _list, false);

	var result = true;
	for(var n = 0; n < ds_list_size(_list); n++)
	{
		var next = ds_list_find_value(_list, n);
		if(next.solid)
		{
			result = false;
			break;
		}
	}

	ds_list_destroy(_list);

	return result;


}
