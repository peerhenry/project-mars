/// @arg wall
// set wall image index, and also modify adjacent wall
with(argument0)
{
	var adj_walls = scr_get_adjacent_instances(id, obj_wall); // ENWS
	for(var n = 0; n < 4; n++) // ENWS
	{
		var next_wall = adj_walls[n];
		if(next_wall != noone)
		{
			var bit = power(2, n);
			if(image_index & bit != bit)
			{
				image_index += bit;
			}
		
			// check if adjacent wall has the bit
			var adj_bit = power(2, (n+2)%4);
			if(next_wall.image_index & adj_bit != adj_bit)
			{
				next_wall.image_index += adj_bit;
			}
		}
	}
	adj_walls = 0; // free array memory
}