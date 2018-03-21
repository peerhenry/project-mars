/// @arg left
/// @arg top
/// @arg width
/// @arg height
var arg_left = argument0;
var arg_top = argument1;
var arg_width = argument2;
var arg_height = argument3;
var right = arg_left + arg_width;
var bottom = arg_top + arg_height;

var item = instance_create_layer(0,0,0,dto_gui_item);
item.left = arg_left;
item.top = arg_top;
item.width = arg_width;
item.height = arg_height;
item.bottom = bottom;
item.right = right;
return item;