var le_room = argument0;
var arg_i = argument1;
var arg_j = argument2;

with(le_room){
	var val = (arg_i << 16) + arg_j;
	var pos = ds_list_find_index(tiles, val);
	if(pos > -1) ds_list_delete(tiles, pos);
}