/// @arg target
var arg_container = argument0;
var arg_target = argument1;

var surrounding_walls = scr_get_surrounding_instances(arg_target, obj_wall);
var surrounding_tiles = scr_get_surrounding_instances(arg_target, obj_base_tile);
var surrounding_comps = scr_get_surrounding_instances(arg_target, obj_base_component);
var visited_walls = ds_list_create();
for(var n = 0; n<8; n++)
{
	// destroy surrounding components
	var comp = surrounding_comps[n];
	var tile = surrounding_tiles[n];
	var wall = surrounding_walls[n];
	
	if(tile != noone)
	{
		// components on top of basetiles are destructed
		if(comp != noone)
		{
			scr_create_destruct_ghost_cell(arg_container, comp, obj_destruct_placemarker);
		}
		
		var needs_wall = false;
		var removal_surrounding_tiles = scr_get_surrounding_instances(tile, obj_base_tile);
		var removal_surrounding_walls = scr_get_surrounding_instances(tile, obj_wall);
		var removal_surrounding_hatches = scr_get_surrounding_instances(tile, obj_hatch);
		for(var m = 0; m<8; m++) // check if surrounding basetiles need to be replaced by walls
		{
			var removal_sur_tile = removal_surrounding_tiles[m];
			var removal_sur_wall = removal_surrounding_walls[m];
			var removal_sur_hatch = removal_surrounding_hatches[m];
			if(removal_sur_tile != noone)
			{
				var abs_di = abs(removal_sur_tile.occ_i - arg_target.occ_i);
				var abs_dj = abs(removal_sur_tile.occ_j - arg_target.occ_j);
				if(abs_di > 1 || abs_dj > 1)
				{
					// tile needs to be replaced by wall
					needs_wall = true;
				}
			} 
			else if(removal_sur_wall != noone) // check if the walls surrounding those tiles need to be removed
			{
				if(ds_list_find_index(visited_walls, removal_sur_wall) == -1) // wall has not been visited
				{
					scr_ghost_destruct_safe_surrounding_wall(arg_container, arg_target, removal_sur_wall);
					ds_list_add(visited_walls, removal_sur_wall);
				}
			}
			else if(removal_sur_hatch != noone) // check if the hatches surrounding those tiles need to be removed or replaced by walls
			{
				if(ds_list_find_index(visited_walls, removal_sur_hatch) == -1) // hatch has not been visited
				{
					scr_ghost_destruct_safe_surrounding_hatch(arg_container, arg_target, removal_sur_hatch);
					ds_list_add(visited_walls, removal_sur_wall);
				}
			}
		}
		
		// The tiles that need walls
		if(needs_wall)
		{
			if(wall == noone)
			{
				// add a wall
				scr_create_destruct_ghost_cell(arg_container, tile, obj_wall);
			}
			else
			{
				// only destruct basetile	
				scr_create_destruct_ghost_cell(arg_container, tile, obj_destruct_placemarker);
			}
		}
		else
		{
			if(wall == noone)
			{
				// only destruct basetile
				scr_create_destruct_ghost_cell(arg_container, tile, obj_destruct_placemarker);
			}
			else
			{
				// also destruct the wall
				scr_create_destruct_ghost_cell(arg_container, wall, obj_destruct_placemarker);
				scr_create_destruct_ghost_cell(arg_container, tile, obj_destruct_placemarker);
			}
		}
	}
	else if(wall != noone)
	{
		if(ds_list_find_index(visited_walls, wall) == -1) // wall has not been visited
		{
			scr_ghost_destruct_safe_surrounding_wall(arg_container, arg_target, wall);
			ds_list_add(visited_walls, wall);
		}
	}
	else if(comp != noone) // C
	{
		if(comp.object_index == obj_hatch)
		{
			if(ds_list_find_index(visited_walls, comp) == -1) // hatch has not been visited
			{
				scr_ghost_destruct_safe_surrounding_hatch(arg_container, arg_target, comp);
				ds_list_add(visited_walls, comp);
			}
		}
	}
}

// Finally, destruct the target cell itself.
if(arg_target.object_index == obj_base_tile)
{
	var comp = instance_position(arg_target.x, arg_target.y, obj_base_component);
	if(comp != noone)
	{
		scr_create_destruct_ghost_cell(arg_container, comp, obj_destruct_placemarker);
	}
	else
	{
		var wall = instance_position(arg_target.x, arg_target.y, obj_wall);
		if(wall != noone)
		{
			scr_create_destruct_ghost_cell(arg_container, wall, obj_destruct_placemarker);
		}
	}
	scr_create_destruct_ghost_cell(arg_container, arg_target, obj_destruct_placemarker);
}
else if(arg_target.object_index == obj_wall)
{
	if(ds_list_find_index(visited_walls, arg_target) == -1)
	{
		scr_create_destruct_ghost_cell(arg_container, arg_target, obj_destruct_placemarker);
	}
}
else scr_create_destruct_ghost_cell(arg_container, arg_target, obj_destruct_placemarker);
ds_list_destroy(visited_walls);