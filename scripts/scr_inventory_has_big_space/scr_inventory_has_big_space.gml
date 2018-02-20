/// @param inventory
var arg_inventory = argument0;

// consider grid quads, one for each group of grid cells that form a square (meaning quads can overlap)
var q_width = ds_grid_width(arg_inventory) - 1;
var q_height = ds_grid_height(arg_inventory) - 1;
var quad_count = q_width*q_height; // the amount of quads in grid

var invalid_quads;
invalid_quads[(q_width)*(q_height) - 1] = 0;

// loop over quads
for(var j = 0; j < q_height; j++)
{
	for(var i = 0; i < q_width; i++)
	{
		//var quad_can_be_valid = invalid_quads[j*(q_width) + i] == 0;	// means the quad has not (yet) been invalidated
		var quad_can_be_valid = true;
		if(quad_can_be_valid)
		{
			var tl = ds_grid_get(arg_inventory, i, j) == macro_inventory_empty;
			var tr = ds_grid_get(arg_inventory, i+1, j) == macro_inventory_empty;
			var bl = ds_grid_get(arg_inventory, i, j+1) == macro_inventory_empty;
			var br = ds_grid_get(arg_inventory, i+1, j+1) == macro_inventory_empty;
			if(tl && tr && bl && br) return true;
			if(!br)	// if the bottom right cell of the quad is not empty
			{
				if(i < q_width-1) invalid_quads[j*(q_width) + i + 1] = 1;	// then quad to the right is invalid
				if(j < q_height-1)invalid_quads[(j+1)*(q_width) + i] = 1;	// quad to the bottom is invalid
				if(j < q_height-1 && i < q_width-1) invalid_quads[(j+1)*(q_width) + i + 1] = 1;	// quad to the bottom-right is invalid
			}
			else
			{
				if(!tr && i < q_width-1) invalid_quads[j*(q_width) + i + 1] = 1; // invalidate right quad
				if(!bl && j < q_height-1) invalid_quads[(j+1)*(q_width) + i] = 1; // invalidate bottom quad
			}
		}
	}
}

return false;