var le_room = argument0;
var i = argument1;
var j = argument2;

var store_value = (i << 16) + j;
with(le_room){
	ds_list_add(tiles, store_value);
}