/// @param inventory
function scr_inventory_get_big_space(argument0) {
	var arg_inventory = argument0;

	// consider grid quads, one for each group of grid cells that form a square (meaning quads can overlap)
	var q_width = arg_inventory.width - 1;
	var q_height = arg_inventory.height - 1;

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
				var tl = ds_grid_get(arg_inventory.space, i, j) == item_type.empty;
				var tr = ds_grid_get(arg_inventory.space, i+1, j) == item_type.empty;
				var bl = ds_grid_get(arg_inventory.space, i, j+1) == item_type.empty;
				var br = ds_grid_get(arg_inventory.space, i+1, j+1) == item_type.empty;
				if(tl && tr && bl && br) return ((i << 8) + j);
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

	return -1;


}
