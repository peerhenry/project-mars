/// @param inventory
var arg_inventory = argument0;

var width = ds_grid_width(arg_inventory);
var height = ds_grid_height(arg_inventory);
show_debug_message("");
show_debug_message("INVENTORY:");
for(var j = 0; j < height; j++)
{
	for(var i = 0; i < width; i++)
	{
		var val = ds_grid_get(arg_inventory, i, j);
		var msg = string(i) + ", " + string(j) + ": " + string(val);
		show_debug_message(msg);
	}
}