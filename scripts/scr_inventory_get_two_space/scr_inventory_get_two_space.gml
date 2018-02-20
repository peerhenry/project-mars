/// @param inventory
var arg_inventory = argument0;

// consider grid quads, one for each group of grid cells that form a square (meaning quads can overlap)
var d_width = ds_grid_width(arg_inventory) - 1;
var d_height = ds_grid_height(arg_inventory);

for(var j = 0; j < d_width; j++)
{
	for(var i = 0; i < d_height; i++)
	{
		var left_vacant = ds_grid_get(arg_inventory, i, j) == macro_inventory_empty;
		var right_vacant = ds_grid_get(arg_inventory, i+1, j) == macro_inventory_empty;
		if(left_vacant && right_vacant) return ((i << 8) + j);
	}
}

return -1;