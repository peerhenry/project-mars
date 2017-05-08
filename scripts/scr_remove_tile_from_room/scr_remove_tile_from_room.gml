var le_room = argument0;
var i = argument1;
var j = argument2;

with(le_room){
	var val = (i << 16) + j;
	var pos = ds_list_find_index(tiles, val);
	if(pos > -1) ds_list_delete(tiles, pos);
}