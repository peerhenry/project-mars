/// @param inventory
var arg_inventory = argument0;

// consider grid quads, one for each group of grid cells that form a square (meaning quads can overlap)
var d_width = arg_inventory.width - 1;
var d_height = arg_inventory.height;

for(var j = 0; j < d_width; j++)
{
	for(var i = 0; i < d_height; i++)
	{
		var left_vacant = ds_grid_get(arg_inventory.space, i, j) == inv_space.empty;
		var right_vacant = ds_grid_get(arg_inventory.space, i+1, j) == inv_space.empty;
		if(left_vacant && right_vacant) return ((i << 8) + j);
	}
}

return -1;