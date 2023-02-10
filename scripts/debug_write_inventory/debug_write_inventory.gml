/// @param inventory
function debug_write_inventory(argument0) {
	var arg_inventory = argument0;

	var width = arg_inventory.width;
	var height = arg_inventory.height;
	show_debug_message("");
	show_debug_message("INVENTORY:");
	for(var j = 0; j < height; j++)
	{
		for(var i = 0; i < width; i++)
		{
			var val = ds_grid_get(arg_inventory.space, i, j);
			var msg = string(i) + ", " + string(j) + ": " + string(val);
			show_debug_message(msg);
		}
	}


}
