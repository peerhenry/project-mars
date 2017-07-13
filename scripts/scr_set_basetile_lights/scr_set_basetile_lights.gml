var arg_instance = argument0;

if(arg_instance.object_index == obj_wall)
{
	var adj_tiles = scr_get_adjacent_instances(arg_instance, obj_base_tile);
	for(var n = 0; n<4; n++) // 0123: ENWS
	{
		var next_tile = adj_tiles[n];
		if(next_tile != noone) next_tile.wall_adjacency += power(2, (n+2)%4);
	}
}
else if(arg_instance.object_index == obj_base_tile)
{
	var adj_walls = scr_get_adjacent_instances(arg_instance, obj_wall);
	for(var n = 0; n<4; n++)	// 0123: ENWS
	{
		var next_wall = adj_walls[n];
		if(next_wall != noone) arg_instance.wall_adjacency += power(2, n);
	}
}