/// @param instance

var tiles = scr_get_adjacent_instances(argument0, obj_base_tile);

for(var s = 0; s < 4; s++) // ENWS
{
	var next_tile = tiles[s];
	if(next_tile != noone)
	{
		next_tile.wall_adjacency -= power(2, (s+2)%4); // ENWS -> WSEN
	}
}